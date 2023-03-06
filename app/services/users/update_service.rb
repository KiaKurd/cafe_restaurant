module Users
  class UpdateService < ActiveInteraction::Base
    attr_reader :params, :user

    hash :params, strip: false
    object :user, class: User

    def execute
      update_user

      user
    end

    def update_user
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