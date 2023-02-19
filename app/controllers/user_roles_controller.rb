class UserRolesController < ApplicationController
    before_action :find_user_role, only: [:show, :destroy]
    
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


    private

    def find_user_role
        @user_role = UserRole.find(params[:id])
    end
end
