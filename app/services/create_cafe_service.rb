class CreateCafeService < ApplicationService
  def initialize(params)
    @params = params
  end

  def call
    create_cafe

    @cafe
  end

  private

  def create_cafe
    @cafe = CafeRestaurantT.new(@params)
    @cafe.save
  end
end
