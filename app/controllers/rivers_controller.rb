class RiversController < ApplicationController

  def show
    @river = River.find(params[:id])
  end

end
