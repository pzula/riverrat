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
    ActiveResource::HttpMock.respond_to do |mock|
      mock.get "/api/v1/rivers.json", {}, @rivers
    end
  end

  it "has a listing of rivers" do
    visit '/'
    expect(page).to have_content("Rivers Near You")
    expect(page).to have_content("Black River")
    expect(page).to have_content("Hawk River")
  end
end
