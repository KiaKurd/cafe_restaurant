class CafeRestaurantTsController < ApplicationController
  before_action :find_cafe, only: %i(show destroy)

  def index
    @cafes = CafeRestaurantT.all
    render json: @cafes.to_json
  end

  def show
    render json: @cafe.to_json
  end

  def destroy
    @cafe.destroy
  end

  private

  def find_cafe
    @cafe = CafeRestaurantT.find(params[:id])
  end
end
