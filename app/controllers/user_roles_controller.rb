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
      # byebug
      result_service = UserRoles::CreateService.new(user_role_params).call
        if result_service.valid? 
          render jsonapi: result_service, 
          status: :created, include: %w(user cafe_restaurant_t)
        else
          render json: result_service, status: :bad_request
        end
    end

    def update
      result_service = UserRoles::UpdateService.new(@user_role, user_role_params).call
      if result_service.valid?
        render jsonapi: result_service.reload, include: %w(user cafe_restaurant_t), status: :accepted #201
      else
        render json: result_service.errors, status: :bad_request #400
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
