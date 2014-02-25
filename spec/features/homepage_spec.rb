require 'spec_helper'

describe "Homepage" do
  before :each do
    @rivers = {"rivers" => [
                          {"name" => "Black River",
                           "id" => 1},
                          {"name" => "Hawk River",
                           "id" => 2}
                          ]
              }.to_json
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
      mock.get "/api/v1/rivers.json", {}, @rivers
      mock.get "/api/v1/gauges.json", {}, @gauges
    end
  end

  it "has a listing of rivers" do
    visit '/'
    expect(page).to have_content("Rivers Near You")
    expect(page).to have_content("Black River")
    expect(page).to have_content("Hawk River")
  end
end
