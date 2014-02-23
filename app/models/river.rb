class River < ActiveResource::Base

  has_many :runs

  self.site = "http://localhost:5555/api/v1/"

end
