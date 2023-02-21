
require 'rails_helper'

RSpec.describe UserRolesController, type: :routing do
  it 'GET api_v1_user_role' do
    expect(get: '/user_roles').to route_to(controller: 'user_roles', action: 'index')
  end

  it 'GET api_v1_user_roles' do
    expect(get: '/user_roles/1').to route_to(controller: 'user_roles', action: 'show', id: '1')
  end

  it 'DELETE api_v1_user_roles' do
    expect(delete: '/user_roles/1').to route_to(controller: 'user_roles', action: 'destroy', id: '1')
  end
end
