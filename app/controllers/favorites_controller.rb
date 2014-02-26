class FavoritesController < ApplicationController

  def create
    current_user.favorites.create(:river_id => params[:river_id])
    redirect_to :back
  end

  def destroy
    current_user.favorites.find_by(:river_id => params[:river_id]).destroy
    redirect_to :back
  end

end
