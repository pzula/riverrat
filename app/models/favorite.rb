class Favorite < ActiveRecord::Base
  belongs_to :user

  validates :river_id, uniqueness: {scope: :user_id}
end
