class RestaurantsController < ApplicationController
  def index
    # to_handle search bar
    if params[:query].present?
      @restaurants = policy_scope(Restaurant.search_by_name_and_category(params[:query])).all
    else
      @restaurants = policy_scope(Restaurant).all
    end

    @markers = @restaurants.geocoded.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude
      }
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @rental = Rental.new
    authorize @restaurant
  end

end
