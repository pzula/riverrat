require 'spec_helper'

describe "A visitor" do

  before :each do
    FactoryGirl.create(:user)
    @rivers = {"rivers" => [
      {"name" => "Black River",
       "id" => 1},
       {"name" => "Hawk River",
        "id" => 2}
    ]
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
    river_data = 10.times.map do |i|
      {"name" => "Brown #{i+1}",
       "id" => i+1}
    end
    @rivers_from_1 = {"rivers" => river_data}.to_json

    ActiveResource::HttpMock.respond_to do |mock|
      mock.get "/api/v1/rivers.json", {}, @rivers
      mock.get "/api/v1/gauges.json", {}, @gauges
      mock.get "/api/v1/rivers.json?limit=10&offset=0", {}, @rivers_from_1
    end
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

  it "can log out" do
    visit "/"
    click_on "Login"
    expect(page).to have_text("Login to your account")
    fill_in "Email", with: "example@example.com"
    fill_in "Password", with: "1234555"
    click_on "Login now!"
    expect(page).to have_text("Welcome back, example@example.com!")
    click_on "Logout"
    expect(page).to have_text("Logged out!")
  end
end
