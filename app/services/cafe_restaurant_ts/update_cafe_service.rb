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
      @cafe.website = @params[:website] if @params.key?(:website)
      @cafe.address = @params[:address] if @params.key?(:address)
      @cafe.description = @params[:description] if @params.key?(:description)
      @cafe.employees = @params[:employees] if @params.key?(:employees)

      @cafe.save
    end
  end
end
