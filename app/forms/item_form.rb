class ItemForm
  include ActiveModel::Model

  attr_accessor :image,
                :purchase_date,
                :prefecture_id,
                :parts_id,
                :brands_name,
                :color_ids,
                :season_ids,
                :brand_ids

  def save
    return false if invalid?
    item = Item.new(image: image, purchase_date: purchase_date, prefecture_id: prefecture_id, parts_id: parts_id)
    item.save
    # item.brands.create(name: brands_name)
    convertingIds(brand_ids).each { |brand_id| item.item_colors.create(brand_id: brand_id) }
    convertingIds(color_ids).each { |color_id| item.item_colors.create(color_id: color_id) }
    convertingIds(season_ids).each { |season_id| item.item_seasons.create(season_id: season_id) }
  end

  def convertingIds(ids)
    ids.split(",").map {|str| str.to_i}
  end
end