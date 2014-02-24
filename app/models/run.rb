class Run < ActiveResource::Base

  self.site = Rails.configuration.api_base_url + "/api/v1/"

  self.prefix = "/api/v1/rivers/:river_id/"

end
