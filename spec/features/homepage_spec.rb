require 'spec_helper'

describe "Homepage" do
  before :each do
    @river = {:river => {:name => "Black River",
                         :id => 1}}.to_json
    @runs = {:runs => [
      {:name => "Soot",
       :river_id => 1},
       {:name => "Ash",
        :river_id => 1}
    ]
    }.to_json
    ActiveResource::HttpMock.respond_to do |mock|
      mock.get "/api/v1/rivers/1.json", {}, @river
      mock.get "/api/v1/rivers/1/runs.json", {}, @runs
    end
  end

  it "has a listing of rivers" do
    visit '/'
    expect(page).to have_content("Rivers Near You")
    expect(page).to have_content("Black River")
    expect(page).to have_content("Hawk River")
  end
end
