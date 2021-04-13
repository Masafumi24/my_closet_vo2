class Api::PrefectureController < ApplicationController
  
  def index
    render json: PrefectureData.data
  end

end