class UsersController < ApplicationController
	before_action :set_user, only: %i[show update destroy]

  #get /users
  def index
		@users = User.all

		render json: @users.to_json
  end

	#get /users/id
  def show
		render json: @user.to_json
  end

  #Delete /users/1
  def destroy
    @user.destroy
  end

  private

	# Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
end
