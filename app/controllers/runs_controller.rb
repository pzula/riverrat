class RunsController < ApplicationController

  def show
    river = River.find(params[:river_id])
    river.prefix_options[:river_id] = river.id
    @run = river.runs.find(params[:id])
  end

end
