require 'spec_helper'

describe "run show page" do

  before :each do
    @river = {
        id: 187,
        name: "Arkansas",
        created_at: "2014-02-20T21:41:39.000Z",
        updated_at: "2014-02-20T21:41:39.000Z",
        state: "CO"
      }.to_json

    @runs = [
      {
        id: 223,
        river_id: 187,
        name: "Leadville to Granite",
        created_at: "2014-02-20T21:41:39.000Z",
        updated_at: "2014-02-26T22:15:04.000Z",
        section: 1,
        difficulty: "I-II (for normal flows)",
        min_flow: 200,
        max_flow: 1000,
        gradient: nil,
        length: 18
      },
      {
        id: 225,
        river_id: 187,
        name: "The Numbers",
        created_at: "2014-02-20T21:41:39.000Z",
        updated_at: "2014-02-26T22:15:04.000Z",
        section: 3,
        difficulty: "IV",
        min_flow: 300,
        max_flow: 3500,
        gradient: 71,
        length: nil
      }].to_json

    @run1 = {
        id: 225,
        river_id: 187,
        name: "The Numbers",
        created_at: "2014-02-20T21:41:39.000Z",
        updated_at: "2014-02-26T22:15:04.000Z",
        section: 3,
        difficulty: "IV",
        min_flow: 300,
        max_flow: 3500,
        gradient: 71,
        length: nil
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
      mock.get "/api/v1/rivers/187.json", {}, @river
      mock.get "/api/v1/rivers/187/runs.json", {}, @runs
      mock.get "/api/v1/rivers/187/runs/225.json", {}, @run1
      # mock.get "/api/v1/gauges.json", {}, @gauges
      # mock.get "/api/v1/gauges.json?run_id=1", {}, @gauges
    end
    visit "/rivers/187"
  end

  it "can follow link to see run details" do
    expect(page).to have_link("The Numbers")
    click_on("The Numbers")
    expect(page).to have_content("IV")
    expect(page).to have_content("71")
  end

end
