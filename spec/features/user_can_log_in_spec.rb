require 'spec_helper'

describe "A visitor" do
  it "can sign up" do
    visit "/"
    click_on "Sign Up"
    expect(page).to have_field("Email")
    fill_in "Email",  with:  "example@example.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_on "Create my account!"
    expect(page).to have_text("Thank you for signing up!")
  end
end
