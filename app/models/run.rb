class Run < ActiveResource::Base

  has_many :gauges

  self.site = Rails.configuration.api_base_url + "/api/v1/"
  self.prefix = "/api/v1/rivers/:river_id/"

end
