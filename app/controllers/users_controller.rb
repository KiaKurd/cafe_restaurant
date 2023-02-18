class UsersController < ApplicationController
	before_action :set_user

	#get /users/1
  def show 
		rander json: @user
  end

	#get /users
  def index 
		users = User.all

		rander json: users
  end

  private

	# Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
end
