class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @rental = Rental.find(params[:rental_id])
    @review.rental = @rental
    @review.save!
    authorize @review
    redirect_to rentals_path()
  end

  def edit
    @review = Review.find(params[:id])
    # need the restaurant to go back to the restaurant show
    @restaurant = Restaurant.find(params[:restaurant_id])
    authorize @review
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    authorize @review
    redirect_to restaurant_path(@restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

end
