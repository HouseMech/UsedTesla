class CarDataCollector
  #ms = Model S, mx = Model X, m3 = Model 3
  def getData(model)
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
      if Car.exists?(carID: carID)
        @selected_car = Car.find_by!(carID: carID)
      else
        Car.create!(carModel: model,carID: carID, autopilot: true, paint:car["OptionCodeSpecs"]["C_OPTS"]["options"][0]["name"], interiorDecor: car["OptionCodeSpecs"]["C_OPTS"]["options"][2]["name"])
        @selected_car = Car.find_by!(carID: carID)
      end

      if model == "ms"
        @selected_car.model_s_data.create!({car_id: carID, car_price: carPrice})
      elsif model == "mx"
        @selected_car.model_x_data.create!({car_id: carID, car_price: carPrice})
      elsif model == "m3"
        @selected_car.model_three_data.create!({car_id: carID, car_price: carPrice})
      end
    end
  end

  def testGetData(model)
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
    JSON.parse(resp.body)

  end
end
