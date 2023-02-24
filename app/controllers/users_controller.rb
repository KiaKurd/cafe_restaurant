class UsersController < ApplicationController
	before_action :set_user, only: %i[show update destroy]

  #GET /users
  def index
		@users = User.all

		render jsonapi: @users, exclude: %w(cafe_restaurant_ts user_roles)
  end

	#GET /users/id
  def show
		render jsonapi: @user, exclude: %W(relationships)
  end
  
  #POST users/id
  def create
    user = User.create(user_params)
    render jsonapi: user
  end

  #PUT /users/id
  def update
    user = User.find(params[:id])
    user.update_attributes(user_params)
    render jsonapi: user
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

  def user_params
    params.require(:user).permit(:name, :address, :email, :tel, :age)
  end
end
