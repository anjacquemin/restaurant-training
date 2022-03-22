class RentalsController < ApplicationController

  def create
    @rental = Rental.new(rental_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @rental.restaurant = @restaurant
    @rental.user = current_user
    @rental.save!
    redirect_to rentals_path()
  end

  def index
    @rentals = Rental.where(user_id: current_user)
    @user = current_user
    @review = Review.new
  end

  private

  def rental_params
    params.require(:rental).permit(:date, :number_of_people)
  end

end
