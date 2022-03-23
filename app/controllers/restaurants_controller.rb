class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    # authorize @restaurants
    @restaurants = policy_scope(Restaurant).all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @rental = Rental.new
    authorize @restaurant
  end

end
