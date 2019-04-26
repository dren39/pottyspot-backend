class ToiletsController < ApplicationController

  def api_request
    # lat = params[:userCoordinates][:lat]
    # lng = params[:userCoordinates][:lng]
    url = "https://www.refugerestrooms.org/api/v1/restrooms/by_location?page=1&per_page=10&offset=0&lat=40.7055801&lng=-74.0130459"
    response = RestClient.get(url)
    # byebug
    hash = JSON.parse(response)
    # byebug
  end

  def create

    toilets = []
    # byebug
    api_request.each do |toilet|
      new_toilet = Toilet.find_or_create_by(api_id: toilet["id"], name: toilet["name"], street: toilet["street"], city: toilet["city"], state: toilet["state"], directions: toilet["directions"], comments: toilet["comment"], lat: toilet["latitude"], long: toilet["longitude"], distance: toilet["distance"])
      toilets << new_toilet
    end
    # byebug
  end
end
