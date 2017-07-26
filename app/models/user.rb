class User < ApplicationRecord
  has_secure_token :auth_token

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, # hashes + stores password in database to validate user authenticity
    :registerable, # handles user sign up, user editing and deleting
    :confirmable, # handles confirmation through email
    :recoverable, # resets the user password and sends email instructions to recover account
    :trackable, # tracks sign in count, timestamps, and IP addresses
    :validatable # provide validations of email and password

  validates :username, uniqueness: { case_sensitive: false }
end
