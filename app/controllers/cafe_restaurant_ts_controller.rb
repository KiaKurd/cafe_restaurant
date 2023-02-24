class CafeRestaurantTsController < ApplicationController
  before_action :find_cafe, only: %i(show destroy)

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

  private

  def find_cafe
    @cafe = CafeRestaurantT.find(params[:id])
  end
end
