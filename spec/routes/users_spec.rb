require 'spec_helper'

RSpec.describe UsersController, type: :routing do 
    it 'Get users' do 
        expect(get: '/users').to route_to(controller: 'users', action: 'index')
    end

    it 'Get users/1' do 
        expect(get: '/users/1').to route_to(controller: 'users', action: 'show', id: '1')
    end

    it 'Delete users' do 
        expect(delete: 'users/1').to route_to(controller: 'users', action: 'destroy', id: '1')
    end
end