class Gauge

  def self.all_gauges_in_geojson
    url = Rails.configuration.api_base_url + '/api/v1/gauges'
    response = Faraday.get url
    json = JSON.parse(response.body)
  end

end
