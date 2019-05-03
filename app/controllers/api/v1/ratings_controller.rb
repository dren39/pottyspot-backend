class Api::V1::RatingsController < ApplicationController

  def create
    # @ratings = []
    # byebug
    @rating = Rating.create(value: params[:value], user_id: params[:user_id], toilet_id: params[:toilet_id])
    @ratings = Rating.select do |rating|
      rating.toilet_id == @rating.toilet_id
    end
    render json: @ratings

  end
end
