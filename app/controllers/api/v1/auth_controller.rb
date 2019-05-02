class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:login, :get_user]

  def login
    # find user in the db whose username matches the username passed in params from the frontend
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      #if a user was found and their password from params was authenticated by has_secure_password then create a token from the found user's id
      token = encode_token(@user.id)
      render json: {user: UserSerializer.new(@user), token: token}, status: :accepted
      #send to frontend a serialized version of the found user and the token
    else
      render json: {message: 'Invalid username or password'}, status: :unauthorized
      # else return an error message
    end
  end

  def get_user
    # this is the method from the /get_user route which is checking to see if a user is already logged in
    if current_user
      #if current_user method return truthy then send to the frontend a serialized version of current_user
      render json: {user: UserSerializer.new(current_user)}
    end
  end

end
