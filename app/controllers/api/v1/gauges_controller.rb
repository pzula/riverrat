class Api::V1::GaugesController < ApplicationController

  def index
    gauges = Gauge.all
    render json: gauges
  end

end
