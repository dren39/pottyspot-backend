class ApplicationController < ActionController::API
  def encode_token(payload)
    # byebug
    JWT.encode({user_id: payload}, "SECRET_KEY")
  end
end
