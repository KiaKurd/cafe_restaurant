module Users
  class CreateService <  ApplicationService
      def initialize(name, email, address, tel, age)
        @name = params[:name]
        @email = params[:email]
        @address = params[:address]
        @tel = params[:tel]
        @age = params[:age]
      end

    def call
      exist_user = User.find_by(email: @email)
      errors.add('Users already exist') if exist_user.present?

      User.create(name: @name, email:@email, address: @address, tel: @tel, age: @age)
    end
  end
end