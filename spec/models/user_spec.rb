require 'spec_helper'

describe User do

  describe "creation" do
    describe "with valid params" do
      it "creates a user" do
        FactoryGirl.build(:user).should be_valid
      end
    end

    describe "with invalid params" do
      it "does not create a user" do
        FactoryGirl.build(:user, :email => nil).should_not be_valid
      end
    end
  end

  describe "favorites" do
    email = "foo@example.com"
    user = User.find_by(:email => email) || FactoryGirl.create(:user, :email => email)
    FactoryGirl.create(:favorite, :user_id => user.id, :river_id => 1)
    (user.favorites.first).should be_kind_of(Favorite)
  end

end
