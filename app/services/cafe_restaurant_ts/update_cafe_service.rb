module CafeRestaurantTs
  class UpdateCafeService
    def initialize(cafe, params)
      @cafe = cafe
      @params = params
    end

    def call
      update_cafe
      @cafe
    end

    private

    def update_cafe
      @cafe.name = @params[:name] if @params.key?(:name)
      @cafe.save
    end
  end
end
