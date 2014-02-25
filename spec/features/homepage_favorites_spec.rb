require 'spec_helper'

describe "favoriting on homepage" do

  before :each do
    @rivers = {
      :rivers => [
        {:name => "Saco",
         :id => 1}
      ]
    }.to_json
    ActiveResource::HttpMock.respond_to do |mock|
      mock.get "/api/v1/rivers.json", {}, @rivers
    end
  end

  describe "for guest user" do
    it "does not show favorite links" do
      visit '/'
      expect(page).to_not have_link('Favorite')
    end
  end

  describe "for a logged in user" do
    before :each do
      user = User.new(:email => "ex@example.com", :password => "foobar")
      register_user(user)
    end

    it "has a favorite button next to each river name" do
      visit '/'
      find('.river-favorite').first(:link, "Favorite").click
      within('.user-favorites') do
        expect(page).to have_content('Saco')
      end
    end
  end

end
