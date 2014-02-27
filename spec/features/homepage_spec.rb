require 'spec_helper'

describe "Homepage" do
  before :each do
    river_data = 10.times.map do |i|
      {"name" => "Brown #{i+1}",
       "id" => i+1}
    end
    @rivers_from_1 = {"rivers" => river_data}.to_json
    river_data = 10.times.map do |i|
      {"name" => "Brown #{i+11}",
       "id" => i+11}
    end
    @rivers_from_11 = {"rivers" => river_data}.to_json

    @gauges = {:gauges => [
      {:geometry => {
        :coordinates => ["10", "11"]
        },
       :run_id => 1},
      {:geometry => {
          :coordinates => ["12", "13"]
        },
       :run_id => 1}
    ]
    }.to_json
    ActiveResource::HttpMock.respond_to do |mock|
      mock.get "/api/v1/rivers.json?limit=10&offset=0", {}, @rivers_from_1
      mock.get "/api/v1/rivers.json?limit=10&offset=10", {}, @rivers_from_11
      mock.get "/api/v1/gauges.json", {}, @gauges
    end

  end

  describe "river pagination" do
    it "paginates 10 rivers on first page" do
      visit '/'
      expect(page).to have_content("Rivers Near You")
      expect(page).to have_content("Brown 1")
      expect(page).to have_content("Brown 10")
      expect(page).to_not have_content("Brown 11")
    end

    it "paginates 11-20 rivers when user clicks next" do
      visit '/'
      click_on('Next')
      expect(page).to_not have_content("Brown 10")
      expect(page).to have_content("Brown 11")
      expect(page).to have_content("Brown 20")
      expect(page).to_not have_content("Brown 21")
    end
  end

end
