class UsersController < ApplicationController
	before_action :set_user, only: %i[show update destroy]

  #get /users
  def index
		users = User.all

		rander json: users.to_json
  end

	#get /users/1
  def show
		rander json: @user
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
