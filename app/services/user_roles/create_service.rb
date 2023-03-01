module UserRoles
  class CreateService
    attr_reader :params
  
    def initialize(params)
      @params = params
    end
  
    def call
      create_user_role
      @user_role
    end
    private
  
    def create_user_role
      @user_role = UserRole.new
      @user_role.role_type = params[:role_type] if params.key?(:role_type)
      @user_role.active = params[:active] if params.key?(:active)
      @user_role.user_id = params[:user_id] if params.key?(:user_id)
      @user_role.cafe_restaurant_t_id = params[:cafe_restaurant_t_id] if params.key?(:cafe_restaurant_t_id)
      if @user_role.valid? == true
        @user_role.save
      else
        @user_role.errors
      end
    end
  end
end



