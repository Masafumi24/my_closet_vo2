class Api::ColorsController < ApplicationController
  
  def index
    render json: Color.all
  end

end