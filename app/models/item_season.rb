class ItemSeason < ApplicationRecord
  belongs_to :item
  belongs_to :season
end