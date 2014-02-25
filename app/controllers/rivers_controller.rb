class RiversController < ApplicationController

  def show
    @river = River.find(params[:id])
    @runs = @river.runs
    run_ids = @runs.map(&:id).join(',')
    @gauges = Gauge.find(:all, params: { :run_id => run_ids }).to_json
  end

end
