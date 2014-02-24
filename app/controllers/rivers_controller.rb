class RiversController < ApplicationController

  def show
    @river = River.find(params[:id])
    @runs = @river.runs
    @run_ids = @runs.map(&:id).join(',')
  end

end
