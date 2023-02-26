module User 
  class UpdateService < ApplicationService
    object :user, class: user

    def initialize(name, email, address, tel, age)
      @name = params[:name]
      @email = params[:email]
      @address = params[:address]
      @tel = params[:tel]
      @age = params[:age]
    end

    def call
      exist_user = User.find_by(email: @email)
      errors.add(:user, 'user not found') unless exist_user.present?

      exist_user.update(name: @name, email: @email, address: @address, tel: @tel, age: @age)
    end
  end
end
