class UpdateCafeService < ApplicationService
  def initialize(cafe, params)
    @cafe = cafe
    @params = params
  end

  def call
    update_cafe
  end

  private

  def update_cafe
    @cafe.update(@params)
  end
end
