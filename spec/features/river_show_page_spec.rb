require 'spec_helper'

describe "river show page" do

  before :each do
    # create a river
    # MOCK HERE
    @river = River.find(1)
  end

  it "displays the river's name" do
    visit "/rivers/#{@river.id}"
    expect(page).to have_content(@river.name)
  end

end
