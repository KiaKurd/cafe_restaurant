module Users
  class CreateService
    attr_reader :user, :params

    def initialize(params)
      @params = params
    end

    def call
      create_user
      user
    end

    def create_user
      exist_user = User.find_by(email: @email)
      errors.add(:exist_user, 'User is already exist') if exist_user.present?
      
      @user = User.new
      user.name = params[:name] if params.key?(:name)
      user.email = params[:email] if params.key?(:email)
      user.address = params[:address] if params.key?(:address)
      user.tel = params[:tel] if params.key?(:tel)
      user.age = params[:age] if params.key?(:age)

      if user.valid? == true
        user.save!
      else 
        user.errors
      end
    end
  end
end