class Api::V1::GaugesController < ApplicationController

  def index
    gauges = Gauge.all_gauges_in_geojson
    render json: gauges
  end

end
