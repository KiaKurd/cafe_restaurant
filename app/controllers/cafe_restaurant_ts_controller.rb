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
    @cafe = CafeRestaurantT.new(cafe_params)
    if @cafe.save
      render jsonapi: @cafe
    else
      render json: @cafe.errors, status: :not_acceptable
    end
  end

  def update
    if @cafe.update(cafe_params)
      render jsonapi: @cafe
    else
      render jsonapi: @cafe.errors
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
