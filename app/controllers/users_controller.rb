class UsersController < ApplicationController
	before_action :set_user, only: %i[show update destroy]

  #get /users
  def index
		@users = User.all

		render jsonapi: @users, exclude: %w(cafe_restaurant_ts user_roles)
  end

	#get /users/id
  def show
		render jsonapi: @user, exclude: %W(relationships)
  end

  #Delete /users/1
  def destroy
    @user.destroy
  end

  def update 

  end

  private

	# Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
end
