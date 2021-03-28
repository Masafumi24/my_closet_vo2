class Api::ItemsController < ApplicationController
  
  def create
    render json: Item.create(items_params)
  end

  private

  def items_params
    params.require(:item).permit(
      :image,
      :purchase_date,
      :prefecture_id,
      :parts_id,
      :brand_name,
      color_ids: [],
      season_ids: [],
      brand_ids: []
    )
  end
end