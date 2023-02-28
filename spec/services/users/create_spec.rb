require 'rails_helper'

RSpec.describe Users::CreateService do
  describe '#call' do
    context 'valid call' do
      it 'creates a new user' do 
        attributes = FactoryBot.attributes_for(:user)

        service_result = described_class.new(attributes).call
        
        expect(service_result.valid?).to be_truthy
        expect(service_result.name).to eql(attributes[:name])
      end
    end
    context 'invalid call' do
      it 'invalid attribute blank name' do
        attributes = FactoryBot.attributes_for(:user, name: '')
        
        service_result = described_class.new(attributes).call
         
        expect(service_result.valid?).to be_falsey
        expect(service_result.errors.messages[:name]).to eql(["can't be blank"])
      end

      it 'invalid attribute nil eamil' do
        attributes = FactoryBot.attributes_for(:user, email: nil)

        service_result = described_class.new(attributes).call
        
        expect(service_result.valid?).to be_falsey
        expect(service_result.errors.messages[:email]).to eql(["can't be blank", "Invalid format"])
      end
    end
  end
end