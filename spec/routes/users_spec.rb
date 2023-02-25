require 'rails_helper'

RSpec.describe UsersController, type: :routing do 
    it 'Get users' do 
        expect(get: '/users').to route_to(controller: 'users', action: 'index')
    end

    it 'Get users/1' do 
        expect(get: '/users/1').to route_to(controller: 'users', action: 'show', id: '1')
    end

    it 'Create user' do
        expect(post: '/users').to route_to(controller: 'users', action: 'create')
    end

    it 'Update user' do
        expect(put: '/users/1').to route_to(controller: 'users', action: 'update', id: '1')
    end

    it 'Delete users' do 
        expect(delete: 'users/1').to route_to(controller: 'users', action: 'destroy', id: '1')
    end
end