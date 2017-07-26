class UserSerializer < ActiveModel::Serializer
  attributes :username, :email, :auth_token
end
