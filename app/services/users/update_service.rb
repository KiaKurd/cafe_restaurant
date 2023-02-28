module Users
  class UpdateService
    attr_reader :params, :exist_user
    def initialize(params)
     @params = params
    end

    def call
      update_user
      
      exist_user
    end

    def update_user
      @exist_user = User.find_by_id(params[:id])
      errors.add(:exist_user, 'user not found') unless exist_user.present?

      exist_user.name = params[:name] if params.key?(:name)
      exist_user.email = params[:email] if params.key?(:email)
      exist_user.address = params[:address] if params.key?(:address)
      exist_user.tel = params[:tel] if params.key?(:tel)
      exist_user.age = params[:age] if params.key?(:age)

      if exist_user.valid?
        exist_user.save!
      else 
        exist_user.errors
      end
    end
  end
end