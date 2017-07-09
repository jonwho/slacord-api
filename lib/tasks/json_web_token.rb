class JsonWebToken
  extend self

  KEY_BASE = Rails.application.secrets.secret_key_base

  def encode(payload)
    JWT.encode(payload, KEY_BASE)
  end

  def decode(token)
    HashWithIndifferentAccess.new(JWT.decode(token, KEY_BASE)[0])
  rescue
    nil
  end
end
