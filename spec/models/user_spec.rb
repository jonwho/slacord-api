require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.build(:user) }

  subject { user }

  it { should respond_to(:username) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username).case_insensitive }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_confirmation_of(:password) }
  it { should allow_value('foo@bar.com').for(:email) }

  it { should be_valid }
end
