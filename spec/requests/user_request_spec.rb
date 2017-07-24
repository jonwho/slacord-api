require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do
  describe 'POST #create' do
    it 'creates a new user using valid parameters' do
      params = {
        user: {
          email: 'foo@bar.com',
          username: 'foobar',
          password: '12341234',
          password_confirmation: '12341234'
        }
      }

      post api_v1_users_path, params: params

      json_response = JSON.parse(response.body)

      expect(json_response).to include('auth_token')
      expect(json_response).to include('email')
      expect(json_response).to include('username')
    end

    it 'rejects user creation given invalid parameters' do

    end
  end
end
