class UserRolesController < ApplicationController
    before_action :find_user_role, only: [:show, :destroy, :update]
    
    def index
        @user_roles = UserRole.all
        render jsonapi: @user_roles, include: %w(user cafe_restaurant_t)
    end

    def show   
        render jsonapi: @user_role, include: %w(user cafe_restaurant_t)
    end
    
    def destroy
        @user_role.destroy
    end

    def create
      @user_role = UserRole.new(user_role_params) 
        if @user_role.save 
          render jsonapi: @user_role, include: %w(user cafe_restaurant_t)
        else
          render json: @user_role.errors, status: :bad_request
        end
    end

    def update
      @user_role = UserRole.find(params[:id])
      if @user_role.update(user_role_params)
        render jsonapi: @user_role, include: %w(user cafe_restaurant_t)
      else
        render json: @user_role.errors, status: :bad_request
      end
    end

    private

    def find_user_role
      @user_role = UserRole.find(params[:id])
    end

    def user_role_params
      params.require(:user_role).permit(
        :user_id,
        :cafe_restaurant_t_id,
        :role_type,
        :active,
        )
    end
end
