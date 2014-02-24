require 'spec_helper'

describe "river show page" do

  before :each do
    @river = {:river => {:name => "Black River",
                         :id => 1}}.to_json
    ActiveResource::HttpMock.respond_to do |mock|
      mock.get "/api/v1/rivers/1.json", {}, @river
    end
    @river1 = River.find(1)
  end

  it "displays the river's name" do
    visit "/rivers/#{@river1.id}"
    expect(page).to have_content(@river1.name)
  end

end
