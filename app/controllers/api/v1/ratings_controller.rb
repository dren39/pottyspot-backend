class Api::V1::RatingsController < ApplicationController

  def create
    Rating.create(value: params[:value], user_id: params[:user_id], toilet_id: params[:toilet_id])
    @toilet = Toilet.find(params[:toilet_id])
    render json: @toilet

  end
end
