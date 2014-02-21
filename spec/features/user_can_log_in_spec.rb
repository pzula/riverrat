require 'spec_helper'

describe "A visitor" do

  before :each do
    FactoryGirl.create(:user)
  end

  it "can sign up" do
    visit "/"
    click_on "Sign Up"
    expect(page).to have_field("Email")
    fill_in "Email",  with:  "example2@example.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_on "Create my account!"
    expect(page).to have_text("Thank you for signing up!")
  end

  it "can log in" do
    visit "/"
    click_on "Login"
    expect(page).to have_text("Login to your account")
    fill_in "Email", with: "example@example.com"
    fill_in "Password", with: "1234555"
    click_on "Login now!"
    expect(page).to have_text("Welcome back, example@example.com!")
  end
end
