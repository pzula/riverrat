class River < ActiveResource::Base

  has_many :runs

  self.site = Rails.configuration.api_base_url + "/api/v1/"

end
