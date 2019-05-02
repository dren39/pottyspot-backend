class ApplicationController < ActionController::API
  # before_action :authorized

  def encode_token(payload)
    #this method takes the user object id passed from the user controller and encodes it using jwt and the secret key from the env file (it's ignored in the gitignore file)
    JWT.encode({user_id: payload}, ENV["SECRET_KEY"])
  end

  def auth_header
    # check requests for an object called headers at a key of Authorization
    request.headers["Authorization"]
  end

  def decode_token
    if auth_header
      #if auth_header returns a token (truthy) the save the token to a token
      token = auth_header
      begin
        JWT.decode(token, ENV["SECRET_KEY"], true, algorithm: "HS256")
        # decode the token with the secret key from the env file, if that is valid and returns truthy then return an array of 2 objects, the original user object and an object of the algorithm
      rescue JWT::DecodeError
        nil
        # else if it is not valid then catch the error and return nil
      end
    end
  end

  def current_user
    if decode_token
      # if decode_token is truthy and returns an array of two objects then grab the user id from the first object at a key of user_id
      user_id = decode_token[0]["user_id"]
      # find the user from the db using the user id
      @user = User.find(user_id)
    end
  end

  def logged_in?
    # returns "true" if current_user exists and returns truthy, else returns "false"
    !!current_user
  end

  def authorized
    #checks if logged_in is true, if not then send an error message
    render json: {message: "Please log in"}, status: unauthorized unless logged_in?
  end

end
