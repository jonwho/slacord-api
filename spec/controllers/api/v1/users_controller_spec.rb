require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  before :each do
    request.headers['Accept'] = "application/vnd.#{Rails.application}.v1"
  end

  describe 'GET #show' do
    let(:user) { FactoryGirl.create(:user) }

    before :each do
      get :show, id: user.id, format: :json
    end

    it 'returns user information' do
      user_response = JSON.parse(response.body, symbolize_names: true)
      expect(user_response[:email]).to eq(user.email)
    end

    it { should respond_with 200 }
  end
end
