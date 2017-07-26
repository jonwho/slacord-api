require 'rails_helper'

RSpec.describe Api::V1::RegistrationsController, type: :request do
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
        post api_v1_registrations_path, params: params
      end.to change{User.count}.from(0).to(1)
    end

    it 'rejects user creation given invalid parameters' do

    end
  end
end
