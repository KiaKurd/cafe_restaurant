require 'rails_helper'

RSpec.describe Users::UpdateService do
  describe '#call' do
    context 'valid call' do
      it 'update the user' do
        user = create(:user)
        attributes = FactoryBot.attributes_for(:user)
        
        service_result = described_class.new(user, attributes).call
        
        expect(service_result.valid?).to be_truthy
        expect(service_result.name).to eql(attributes[:name])
      end
    end
    context 'invalid call' do
      it 'invalid attributes blank name' do
        user = create(:user)
        attributes = FactoryBot.attributes_for(:user, name:'')

        service_result = described_class.new(user, attributes).call
        
        expect(service_result.valid?).to be_falsey
        expect(service_result.errors.messages[:name]).to eql(["can't be blank"])
      end

      it 'invalid attributes nil eamil' do
        user = create(:user)
        attributes = FactoryBot.attributes_for(:user, email: nil)

        service_result = described_class.new(user, attributes).call

        expect(service_result.valid?).to be_falsey
        expect(service_result.errors.messages[:email][0]).to eql("can't be blank")
        expect(service_result.errors.messages[:email][1]).to eql("Invalid format")
      end
    end
  end
end