class VehicleDataCollector

  def call(model)
    conn = Faraday.new(
      url: 'https://www.tesla.com',
      headers: {'Content-Type' => 'application/json'}
    )

    params = {
      query: {
        query: {
          model: model,
          condition: "used",
          options: {},
          arrangeby: "Price",
          order: "asc",
          market: "CA",
          language: "en",
          super_region: "north america",
          lng: -123.1565692,
          lat: 49.2338399,
          zip: "V6M 2B7",
          range: 0,
          region: "BC"
        },
        offset: 0,
        count: 50,
        outsideOffset: 0,
        outsideSearch: false
      }.to_json
    }


    resp = conn.get('inventory/api/v1/inventory-results') do |req|
      req.params = params
    end
    vehiclelist = JSON.parse(resp.body)
    for vehicle in vehiclelist["results"]
      vehicleVIN = vehicle["VIN"] #The vehicle ID is referred to as VIN on the Tesla website
      vehiclePrice = vehicle["Price"].to_i
      if Vehicle.exists?(vin: vehicleVIN)
        @selected_vehicle = Vehicle.find_by!(vin: vehicleVIN)
      else
        Vehicle.create!(
          model: model,
          full_model_name: vehicle["FactoryGatedDate"].to_date.year.to_s + " " + getModel(model),
          trim_name: model != "m3" ? vehicle["TRIM"] : "TEMPORARY",
          vin: vehicleVIN,
          autopilot: true,
          paint:vehicle["OptionCodeSpecs"]["C_OPTS"]["options"][0]["name"],
          interior_decor: vehicle["OptionCodeSpecs"]["C_OPTS"]["options"][2]["name"],
          tires: vehicle["OptionCodeSpecs"]["C_OPTS"]["options"][1]["name"],
          acceleration_time: vehicle["OptionCodeSpecs"]["C_SPECS"]["options"][0]["name"].to_f,
          roof: model != "m3" && model != "mx" ? vehicle["OptionCodeSpecs"]["C_OPTS"]["options"][4]["name"] : "Standard",
          vehicle_history: vehicle["VehicleHistory"] == "PREVIOUS ACCIDENT(S)" ? "Previously Repaired" : "Clean History",
          top_speed: vehicle["OptionCodeSpecs"]["C_SPECS"]["options"][1]["name"].to_i,
          battery_range: vehicle["OptionCodeSpecs"]["C_SPECS"]["options"][1]["name"].to_i,
          sold: false
        )
        @selected_vehicle = Vehicle.find_by!(vin: vehicleVIN)
      end
      @selected_vehicle.vehicle_data.create!({price: vehiclePrice, data_acquired: Date.today})
    end
  end

  #This method should be run only after the call method has been run. It will determine if a vehicle_data entry has been made for a vehicle
  #today, if not, the car doesn't show up in the Tesla database meaning it has been sold.
  def isSold()
    @unsold_vehicles = Vehicle.all
    for vehicle in @unsold_vehicles
      if vehicle.vehicle_data.all.where(data_acquired: Date.today).empty?
        vehicle.update(sold: true, sold_date: Date.today)
      else
        vehicle.update(sold: false)
      end
    end
  end

  def getModel(model)
    case model
    when "ms"
      then "Model S"
    when "mx"
      then "Model X"
    when "m3"
      then "Model 3"
    else
      "Unknown Model Type"
    end
  end

  private :getModel
end
