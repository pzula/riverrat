require 'spec_helper'

describe River do
  before :each do
    @river = {:river => {:name => "Black River"}}.to_json
    ActiveResource::HttpMock.respond_to do |mock|
      mock.get "/api/v1/rivers/1.json", {}, @river
    end
  end

  describe "fetching" do

    it "finds the proper river" do
      river = River.find(1)
      expect(river.name).to eq("Black River")
    end
  end

  describe "run association" do
    it "finds the associated runs for this river" do
      river = River.find(1)
      runs = river.runs
      expect(runs).not_to be_nil
    end
  end

end
