class UsersController < ApplicationController
	before_action :set_user, only: %i[show update destroy]

  #GET /users
  def index
		@users = User.all

		render jsonapi: @users, 
      include: %w(user_role cafe_restaurant_t),
      fields: {
        user: %w(name address age),
        user_role: %w(role_type active),
        cafe_restaurant_t: %w(name website description)
      }
  end

	#GET /users/id
  def show
		render jsonapi: @user, fields: { user: %w(name address age) }
  end
  
  #POST /users
  def create
    result = Users::CreateService.run(params: user_params)
    if result.valid?
      render jsonapi: result.result, exclude: %w(email), status: :created #201
    else
      render json: result.errors, status: :bad_request #400
    end
  end

  #PUT /users/id
  def update
    result = Users::UpdateService.run(user: @user, params: user_params)
    if result.valid?
      render jsonapi: result.result.reload, status: :accepted #202
    else
      render json: result.errors, status: :bad_request #400
    end
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

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(
      :name,
      :address, 
      :email, 
      :tel, 
      :age
    )
  end
end
