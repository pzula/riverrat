require 'spec_helper'

describe "river show page" do

  before :each do
    @river = {:river => {:name => "Black River",
                         :id => 1}}.to_json
    @run1 =
      {:runs => [
        {:river_id => 1, :name => "big drop", :id => 1},
        {:river_id => 2, :name => "small flip", :id => 2},
    ]}.to_json
    @gauges1 = {:gauges => [
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
    @gauges2 = {:gauges => [
      {:geometry => {
        :coordinates => ["1","2"]
        },
       :run_id => 2},
      {:geometry => {
          :coordinates => ["2", "3"]
        },
       :run_id => 2}
    ]
    }.to_json
    ActiveResource::HttpMock.respond_to do |mock|
      mock.get "/api/v1/rivers/1.json", {}, @river
      mock.get "/api/v1/rivers/1/runs.json", {}, @run1
      mock.get "/api/v1/gauges.json?run_id=1", {}, @gauges1
      mock.get "/api/v1/gauges.json?run_id=2", {}, @gauges2
    end
    visit "/rivers/1"
  end

  it "displays the river's name" do
    expect(page).to have_content("Black River")
  end

  it "displays the river's runs" do
    expect(page).to have_content("big drop")
    expect(page).to_not have_content("small flip")
  end

  it "displays the associated gauges for each run" do
    expect(page).to have_content("13")
    expect(page).to_not have_content("2")
  end
end
