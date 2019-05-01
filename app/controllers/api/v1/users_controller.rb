class Api::V1::UsersController < ApplicationController
  def create
    @user = User.create(username:params[:user][:username], password:params[:user][:password])
    # byebug
    if @user.valid?
      # byebug
      @token = encode_token(@user.id)
      render json: {user: UserSerializer.new(@user), token: @token}, status: :created
    else
      render json: {error: 'failed to create user'}, status: :not_acceptable
    end
  end
end
