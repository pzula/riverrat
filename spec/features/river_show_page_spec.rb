require 'spec_helper'

describe "river show page" do

  before :each do
    @river = {:river => {:name => "Black River",
                         :id => 1}}.to_json
    @run1 =
      {:runs => [
        {:river_id => 1, :name => "big drop"},
        {:river_id => 1, :name => "small flip"},
    ]}.to_json
    ActiveResource::HttpMock.respond_to do |mock|
      mock.get "/api/v1/rivers/1.json", {}, @river
      mock.get "/api/v1/rivers/1/runs.json", {}, @run1
    end
    visit "/rivers/1"
  end

  it "displays the river's name" do
    expect(page).to have_content("Black River")
  end

  it "displays the river's runs" do
    expect(page).to have_content("big drop")
    expect(page).to have_content("small flip")
  end

end
