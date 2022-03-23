class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @rental = Rental.find(params[:rental_id])
    @review.rental = @rental
    @review.save!
    redirect_to rentals_path()
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

end
