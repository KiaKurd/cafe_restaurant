class UserRolesController < ApplicationController

    def index
        @user_roles = UserRole.all
        render json: @user_roles.to_json
    end

    def show   
        @user_role = UserRole.find(params[:id])
        render json: @user_role.to_json
    end
end
