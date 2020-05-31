class CarDataCollector

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
    carlist = JSON.parse(resp.body)
    for car in carlist["results"]
      carID = car["VIN"] #The Car ID is referred to as VIN on the Tesla website
      carPrice = car["Price"].to_i
      if Vehicle.exists?(vin: carID)
        @selected_car = Vehicle.find_by!(car_id: carID)
      else
        Vehicle.create!(model: model,
          vin: carID,
          autopilot: true,
          paint:car["OptionCodeSpecs"]["C_OPTS"]["options"][0]["name"],
          interior_decor: car["OptionCodeSpecs"]["C_OPTS"]["options"][2]["name"],
          tires: car["OptionCodeSpecs"]["C_OPTS"]["options"][1]["name"],
          acceleration_time: car["OptionCodeSpecs"]["C_SPECS"]["options"][0]["name"].to_f,
          roof: model == "m3" ? "" : car["OptionCodeSpecs"]["C_SPECS"]["options"][5]["name"],
          vehicle_history: car["VehicleHistory"] == "PREVIOUS ACCIDENT(S)" ? "Previously Repaired" : "Clean History",
          top_speed: car["OptionCodeSpecs"]["C_SPECS"]["options"][1]["name"].to_i,
          battery_range: car["OptionCodeSpecs"]["C_SPECS"]["options"][1]["name"].to_i
        )
        @selected_vehicle = Vehicle.find_by!(vin: carID)
      end
      @selected_vehicle.vehicle_data.create!({price: carPrice, data_acquired: Date.today})
    end
  end
end
