class FavoritesController < ApplicationController

  def create
    current_user.favorites.create(:river_id => params[:river_id])
    redirect_to :back
  end

end
