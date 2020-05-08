class CarDataCollector
  def getDataForModelS
    conn = Faraday.new(
      url: 'https://www.tesla.com',
      headers: {'Content-Type' => 'application/json'}
    )

    params = {
      query: {
        query: {
          model: "ms",
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
      if (ModelSdatum.where(carID: carID).any?)
        ModelSdatum.find_by(carID: carID).update(carPrice: carPrice)
      else
        ModelSdatum.create!({carID: carID,carPrice: carPrice})
      end
    end
  end
end
