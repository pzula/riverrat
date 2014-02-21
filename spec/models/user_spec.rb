require 'spec_helper'

describe User do
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
