class Run < ActiveResource::Base

  self.site = "http://localhost:5555/api/v1/"

  self.prefix = "/api/v1/rivers/:river_id/"

end
