class Gauge

  def self.all_gauges_in_geojson
    response = Faraday.get 'http://localhost:5000/api/v1/gauges'
    json = JSON.parse(response.body)
  end

end
