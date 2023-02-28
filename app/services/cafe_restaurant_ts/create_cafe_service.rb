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
      @cafe.website = @params[:website]
      @cafe.address = @params[:address]
      @cafe.description = @params[:description]
      @cafe.employees = @params[:employees]

      @cafe.save
    end
  end
end
