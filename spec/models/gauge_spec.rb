require 'spec_helper'

describe Gauge do

  describe "all_gauges_in_geojson" do
    it "should return gauges in geojson" do
      file_path = File.expand_path('../../data/gauge_geojson', __FILE__)
      mock_gauges = File.read(file_path)
      Gauge.stub(:all_gauges_in_geojson).and_return(JSON.parse(mock_gauges))

      gauges = Gauge.all_gauges_in_geojson

      expect(gauges.first["properties"]["title"]).to eq("foo")
    end
  end

end
