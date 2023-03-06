module  UserRoles
  class UpdateService 
    attr_reader :user_role, :params

    def initialize(user_role, params)
      @user_role = user_role
      @params = params
    end

    def call
      user_role_update
      
      user_role
    end

    private

    def user_role_update
      user_role.role_type = params[:role_type] if params.key?(:role_type) 
      user_role.active = params[:active] if params.key?(:active)
      user_role.user_id = params[:user_id] if params.key?(:user_id)
      user_role.cafe_restaurant_t_id = params[:cafe_restaurant_t_id] if params.key?(:cafe_restaurant_t_id)
      
      user_role.save
    end
  end
end