class RiversController < ApplicationController

  def show
    @river = River.find(params[:id])
    @runs = @river.runs
  end

end
