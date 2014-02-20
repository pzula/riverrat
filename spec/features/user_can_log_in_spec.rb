require 'spec_helper'

describe "A visitor" do
  it "can sign up" do
    visit "/"
    click_on "Sign Up"
    expect(page).to have_content("Choose a username")
  end
end
