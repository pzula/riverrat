require 'spec_helper'

describe Favorite do
  it "does not create duplicate favorites" do
    FactoryGirl.create(:favorite, :user_id => 1, :river_id => 1).should be_valid
    FactoryGirl.build(:favorite, :user_id => 1, :river_id => 1).should_not be_valid
  end
end
