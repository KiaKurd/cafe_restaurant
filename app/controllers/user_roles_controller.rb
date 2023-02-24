class UserRolesController < ApplicationController
    before_action :find_user_role, only: [:show, :destroy, :update]
    
    def index
        @user_roles = UserRole.all
        render json: @user_roles.to_json
    end

    def show   
        render json: @user_role.to_json
    end
    
    def destroy
        @user_role.destroy
    end

    def create  
        @user_role = UserRole.new(user_role_params)
        if @user_role.save 
          render :show, status: :created, location: @user_role
        else
          render json: @user_role.errors, status: :unprocessable_entity
        end
    end

    def update
      @user_role = UserRole.find(params[:id])
      if @user_role.update(user_role_params)
        render :show, status: :ok, location: @user_role
      else
        render json: @user_role.errors, status: :unprocessable_entity 
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
