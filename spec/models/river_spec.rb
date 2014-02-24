require 'spec_helper'

describe River do
  before :each do
    @river = {:river => {:name => "Black River",
                         :id => 1}}.to_json
    @runs = {:runs => [
      {:name => "Soot",
       :river_id => 1},
      {:name => "Ash",
       :river_id => 1}
    ]
    }.to_json
    ActiveResource::HttpMock.respond_to do |mock|
      mock.get "/api/v1/rivers/1.json", {}, @river
      mock.get "/api/v1/rivers/1/runs.json", {}, @runs
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
