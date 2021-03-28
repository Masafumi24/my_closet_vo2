class Season < ApplicationRecord
  has_many :item_seasons
  has_many :items, through: :item_seasons
end