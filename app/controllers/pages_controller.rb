class PagesController < ApplicationController
  def home
    offset = params[:offset] || 0
    @next_offset = offset.to_i + 10
    @rivers = River.find(:all, params: {:offset => offset, :limit => 10})
    @gauges = Gauge.all.to_json
    @favorite_rivers = []
    if current_user
      favorite_river_ids = current_user.favorites.map(&:river_id)
      @favorite_rivers = @rivers.select { |river| favorite_river_ids.include?(river.id) }
    end
  end
end
