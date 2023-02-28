module CafeRestaurantTs
  class CreateCafeService
    def initialize(params)
      @params = params
    end

    def call
      create_cafe

      @cafe
    end

    private

    def create_cafe
      @cafe = CafeRestaurantT.new
      @cafe.name = @params[:name]
      @cafe.save
    end
  end
end
