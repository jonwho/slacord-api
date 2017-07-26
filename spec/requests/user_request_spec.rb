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

      expect do
        post api_v1_users_path, params: params
      end.to change{User.count}.by(1)

      expect(response.status).to be 201

      json_response = JSON.parse(response.body)

      # TODO: test json response better
      # need to ensure only returning serialized data
      expect(json_response).to include('auth_token')
      expect(json_response).to include('email')
      expect(json_response).to include('username')
    end

    it 'rejects user creation given invalid parameters' do
      params = {
        user: {
          email: '',
          username: '',
          password: '',
          password_confirmation: ''
        }
      }

      expect do
        post api_v1_users_path, params: params
      end.to_not change{User.count}

      json_response = JSON.parse(response.body)

      # TODO: test json response better
      # need to ensure only returning serialized data
      expect(json_response).to include('errors')
    end
  end

    let(:user) { FactoryGirl.create(:user) }
  describe 'GET #show' do
    it 'retrieves user info with given id' do
      get api_v1_user_path(user.id)

      expect(response.status).to be 200

      json_response = JSON.parse(response.body)

      # TODO: test json response better
      # need to ensure only returning serialized data
      expect(json_response).to include('auth_token')
      expect(json_response).to include('email')
      expect(json_response).to include('username')
    end

    it 'returns 404 for user not found' do
      get api_v1_user_path(404)

      expect(response.status).to be 404

      json_response = JSON.parse(response.body)

      # TODO: test json response better
      # need to ensure only returning serialized data
      expect(json_response).to include('errors')
    end
  end
end
