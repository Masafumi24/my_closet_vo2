class Api::ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create
    item = ItemForm.new(items_params)
    render json: item.save
  end

  private

  def items_params
    params.permit(
      :image,
      :purchase_date,
      :prefecture_id,
      :parts_id,
      :brands_names,
      :color_ids,
      :season_ids,
      :brand_ids
    )
  end
end