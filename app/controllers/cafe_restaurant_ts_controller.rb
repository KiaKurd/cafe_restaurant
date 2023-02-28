class CafeRestaurantTsController < ApplicationController
  before_action :find_cafe, only: %i(show destroy update)

  def index
    @cafes = CafeRestaurantT.all
    render jsonapi: @cafes, include: %w(user_roles users)
  end

  def show
    render jsonapi: @cafe, include: %w(user_roles users)
  end

  def destroy
    @cafe.destroy
  end

  def create
    result = CafeRestaurantTs::CreateCafeService.new(cafe_params).call
    if result.valid?
      render jsonapi: result, status: :created
    else
      render json: result.errors, status: :bad_request
    end
  end

  def update
    result = CafeRestaurantTs::UpdateCafeService.new(@cafe, cafe_params).call
    if result.valid?
      render jsonapi: result.reload
    else
      render json: result.errors
    end
  end

  private

  def find_cafe
    @cafe = CafeRestaurantT.find(params[:id])
  end

  def cafe_params
    params.require(:cafe_restaurant_t).permit(
      :name,
      :website,
      :address,
      :description,
      :employees
      )
  end
end
