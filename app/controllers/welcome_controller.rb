class WelcomeController < ApplicationController

    def index
        toilets = []
        render json: toilets
    end
end
