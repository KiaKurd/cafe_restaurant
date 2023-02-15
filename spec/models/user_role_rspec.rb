require 'rails_helper'

RSpec.describe UserRole, type: :model do
    subject(:user_role) { create(:user_role) }

    context 'associations' do
        it { expect(user_role).to belong_to(:user) }
        it { expect(user_role).to belong_to(:cafe_restaurant_t) }
    end

    context 'validations' do
        context 'active boolean' do 
            it 'active is true' do               
                user_role = create(:user_role, active: true)
                expect(user_role.active).to be true
            end
            it 'active is false' do
                user_role = create(:user_role, active: false)
                expect(user_role.active).to be false
            end
        end
        context 'role_type format' do
            it 'is valid on waiter' do
              role_type = "waiter"
              user_role = create(:user_role, role_type: role_type)
      
              # Expects
              expect(user_role.role_type).to eql(role_type)
            end

            it 'is valid on chef' do
                role_type = "chef"
                user_role = create(:user_role, role_type: role_type)
      
              # Expects
              expect(user_role.role_type).to eql(role_type)
            end

            it 'is valid on admin' do
              role_type = "admin"
              user_role = create(:user_role, role_type: role_type)
      
              # Expects
              expect(user_role.role_type).to eql(role_type)
            end
            it 'is not valid role_type' do
                role_type = "manager"
                
                # Expects
                expect { create(:user_role, role_type: role_type) }.to raise_error(ArgumentError)
            end
        end
    end
end
