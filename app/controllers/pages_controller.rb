class PagesController < ApplicationController
  def home
    current_offset = params[:offset] || 0
    set_offsets(current_offset)
    @rivers = River.find(:all, params: {:offset => current_offset, :limit => 10})
    @gauges = Gauge.all.to_json
    @favorite_rivers = []
    if current_user
      favorite_river_ids = current_user.favorites.map(&:river_id)
      @favorite_rivers = @rivers.select { |river| favorite_river_ids.include?(river.id) }
    end
  end

  def set_offsets(offset)
    @prev_offset = offset.to_i == 0 ? 0 : offset.to_i - 10
    @next_offset = offset.to_i + 10
  end
end
