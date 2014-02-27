class RunsController < ApplicationController

  def show
    river = River.find(params[:river_id])
    @run = river.runs.find{ |r| r.id == params[:id].to_i }
  end

end
