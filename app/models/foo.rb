#https://www.tesla.com/inventory/api/v1/inventory-results?count=50&offset=0&outsideOffset=0&outsideSearch=false&query%5Barrangeby%5D=Price&query%5Bcondition%5D=used&query%5Blanguage%5D=en&query%5Blat%5D=49.2338399&query%5Blng%5D=-123.1565692&query%5Bmarket%5D=CA&query%5Bmodel%5D=ms&&query%5Border%5D=asc&query%5Brange%5D=0&query%5Bregion%5D=BC&query%5Bsuper_region%5D=north+america&query%5Bzip%5D=V6M+2B7
#https://www.tesla.com/inventory/api/v1/inventory-results?query=%7B%22query%22%3A%7B%22model%22%3A%22ms%22%2C%22condition%22%3A%22used%22%2C%22options%22%3A%7B%7D%2C%22arrangeby%22%3A%22Price%22%2C%22order%22%3A%22asc%22%2C%22market%22%3A%22CA%22%2C%22language%22%3A%22en%22%2C%22super_region%22%3A%22north%20america%22%2C%22lng%22%3A-123.1565692%2C%22lat%22%3A49.2338399%2C%22zip%22%3A%22V6M%202B7%22%2C%22range%22%3A0%2C%22region%22%3A%22BC%22%7D%2C%22offset%22%3A0%2C%22count%22%3A50%2C%22outsideOffset%22%3A0%2C%22outsideSearch%22%3Afalse%7D

class Foo
  def self.foo
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

    JSON.parse(resp.body)

  end
end
