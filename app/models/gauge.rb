class Gauge < ActiveResource::Base

  self.site = Rails.configuration.api_base_url + "/api/v1/"

end
