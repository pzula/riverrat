class Gauge

  def self.all_gauges_in_geojson
    response = Faraday.get api_gauges_url
    json = JSON.parse(response.body)
  end

  private

  def self.api_gauges_url
    Rails.configuration.api_base_url + '/api/v1/gauges'
  end

end
