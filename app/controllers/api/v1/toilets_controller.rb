class Api::V1::ToiletsController < ApplicationController

  def index
    @toilets = Toilet.all
    render json: @toilets
  end

  def api_request
    # this grabs the lat,lng from params that's passed from the frontend and makes an external api GET request
    lat = params[:lat]
    lng = params[:lng]
    url = "https://www.refugerestrooms.org/api/v1/restrooms/by_location?page=1&per_page=10&offset=0&lat=#{lat}&lng=#{lng}"
    # interpolate lat,lng into the url
    response = RestClient.get(url)
    # response is the GET response of the url
    hash = JSON.parse(response)
    # hash is the response that's been json parsed (it's an array of hashes) and is the thing this method returns
  end

  def create
    # this creates an empty toilet array then iterates through api_request
    @toilets = []
    api_request.each do |toilet|
      # api_request is a method that returns an array of hashes
      found_toilet = Toilet.find_by(api_id: toilet["id"])
      # go through the Toilet database and find a toilet object who's api_id is equal to the id of the current toilet we're iterating
      if found_toilet
        # if the toilet exists and we found it then push it into the toilets array
        @toilets << found_toilet
      else
        #if it doesn't exist in the db then create a new instance of a toilet using these attributes of that api toilet object then push it into the array
        new_toilet = Toilet.create(api_id: toilet["id"], name: toilet["name"], street: toilet["street"], city: toilet["city"], state: toilet["state"], directions: toilet["directions"], comments: toilet["comment"], lat: toilet["latitude"], long: toilet["longitude"], distance: toilet["distance"])
        @toilets << new_toilet
      end
    end
    render json: @toilets
    # send the array of toilets to the frontend
  end

  def update
    @toilet = Toilet.find(params[:id])
    # find a toilet in the db who's id is equal to the id number passed in params from the frontend
    if params[:password]
      # if password is being passed in params then do an update on the toilet using the password params
      @toilet.update(password: params[:password])
      render json: @toilet
    else
      # else the params being passed must be purchase so update the purchase boolean for this toilet
      @toilet.update(purchase: params[:purchase])
      render json: @toilet
    end

  end
end
