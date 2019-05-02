class Api::V1::UsersController < ApplicationController
# skip_before_action :authorized, only: [:create]
  def create
    # this is creating a user using the params passed in from the frontend
    @user = User.create(username:params[:user][:username], password:params[:user][:password])
    if @user.valid?
      # if the creating was valid then create an encoded token using the newly created user object's id and passing it into the encode_token method (defined in application controller)
      @token = encode_token(@user.id)
      render json: {user: UserSerializer.new(@user), token: @token}, status: :created
      # return to the frontend a json object with a key called user who's value is the serialized version of the new user object, and a key called token who's value is the token created earlier
    else
      render json: {error: 'failed to create user'}, status: :not_acceptable
      # else send an error message
    end
  end

end
