=begin
Use a serializer permit which fields are exposed to a JSON API.
Attributes not specified will not be retrieved from record.
=end
class UserSerializer < ActiveModel::Serializer
  attributes :email, :username

  # can modify how fields are returned for API
  # this method turns the email field to only return
  # the email portion before the @ symbol
  def email
    email_split = object.email.split('@')
    email_split.first
  end
end
