class PagesController < ApplicationController
  def home
    @rivers = River.all
    @favorite_rivers = []
    if current_user
      favorite_river_ids = current_user.favorites.map(&:river_id)
      @favorite_rivers = @rivers.select { |river| favorite_river_ids.include?(river.id) }
    end
  end
end
