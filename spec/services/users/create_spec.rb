require 'rails_helper'

RSpec.describe Users::CreateService do
  describe '#call' do
    context 'valid call' do
      it 'creates a new user' do 
        attributes = FactoryBot.attributes_for(:user)
        service_result = described_class.run(params: attributes)
        
        expect(service_result.valid?).to be_truthy
        expect(service_result.result.name).to eql(attributes[:name])
      end
    end
    context 'invalid call' do
      it 'invalid attribute blank name' do
        attributes = FactoryBot.attributes_for(:user, name: '')
        
        service_result = described_class.run(params: attributes)

        expect(service_result.valid?).to be_falsey
        expect(service_result.errors.messages[:base]).to eql(["Name can't be blank"])
      end

      it 'invalid attribute nil eamil' do
        attributes = FactoryBot.attributes_for(:user, email: nil)

        service_result = described_class.run(params: attributes)
        
        expect(service_result.valid?).to be_falsey
        expect(service_result.errors.messages[:base]).to eql(["Email can't be blank", "Email Invalid format"])
      end
    end
  end
end