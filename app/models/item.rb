class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture_data

  has_many :item_brands
  has_many :brands, through: :item_brands

  has_many :item_colors
  has_many :colors, through: :item_colors

  has_many :item_seasons
  has_many :seasons, through: :item_seasons
end
