# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserRoles::UpdateService do
  context 'valid call' do
    it 'Update role_type successfully' do
      # Required data
      user_role  = create(:user_role)

      params  = {role_type: 'chef'}

      # Services
      service_result = described_class.run(user_role: user_role, params: params)

      # Expects
      expect(user_role.role_type).to eql(params[:role_type])
    end

    it 'Update active successfully' do
      # Required data
      user_role  = create(:user_role)

      params  = {active: true}

      # Services
      service_result = described_class.run(user_role: user_role, params: params)

      # Expects
      expect(user_role.active).to eql(params[:active])
    end
  end
end
