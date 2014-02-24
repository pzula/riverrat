require 'spec_helper'

describe Run do
  before :each do
    @river = {:river => {:name => "Black River",
                         :id => 1}
    }.to_json
    @runs = {:runs => [
      {:name => "Soot",
       :river_id => 1,
       :id => 2},
      {:name => "Ash",
       :river_id => 1,
       :id => 3}
    ]
    }.to_json
    @run = {:run => {:name => "Big Run",
                     :id => 1,
                     :river_id => 1}
    }.to_json
    @gauges = {:gauges => [
      {:name => "Medium",
       :run_id => 1},
      {:name => "XL",
       :run_id => 1}
    ]
    }.to_json
    ActiveResource::HttpMock.respond_to do |mock|
      mock.get "/api/v1/rivers/1.json", {}, @river
      mock.get "/api/v1/rivers/1/runs.json", {}, @runs
      mock.get "/api/v1/rivers/1/runs/1.json", {}, @run
      mock.get "/api/v1/gauges.json?run_id=1", {}, @gauges
    end
  end

  describe "run.guages association" do
    it "returns associated gauges" do
      gauges = Gauge.find(:all, :params => {'run_id' => 1})
      expect(gauges.map(&:name)).to match_array(["Medium", "XL"])
    end
  end
end
