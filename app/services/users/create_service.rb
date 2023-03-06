module Users
  class CreateService < ActiveInteraction::Base
    attr_reader :user, :params
    
    hash :params, strip: false

    def execute
      create_user
      
      user
    end

    def create_user
      @user = User.new
      user.name = params[:name] if params.key?(:name)
      user.email = params[:email] if params.key?(:email)
      user.address = params[:address] if params.key?(:address)
      user.tel = params[:tel] if params.key?(:tel)
      user.age = params[:age] if params.key?(:age)

      user.save

      errors.merge!(@user.errors) if user.errors.present?
    end
  end
end