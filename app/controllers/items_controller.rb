class Api::ItemsController < ApplicationController

  def index
  end

  def create
    @item = Items.new(tops_params)
  end

  private

  def items_params
    params.require(:item).permit(
      :image,
      :purchase_date,
      :prefecture_id,
      :parts_id
      :brand_name,
      color_ids: [],
      season_ids: [],
      brand_ids: []
    )
  end
end