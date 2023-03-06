
module  UserRoles
  class UpdateService < ActiveInteraction::Base
    object :user_role, class: UserRole
    hash :params, strip: false

    def execute
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

      errors.merge!(@user_role.errors) if @user_role.errors.present?
    end
  end
end