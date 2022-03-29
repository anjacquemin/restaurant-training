class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @rental = Rental.find(params[:rental_id])
    @review.rental = @rental
    authorize @review
    @rentals = Rental.where(user_id: current_user)
    if @review.save
      redirect_to rentals_path(anchor: "review-#{@review.id}")
    else
      render 'rentals/index'
    end
  end

  def edit
    @review = Review.find(params[:id])
    authorize @review
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    authorize @review
    if @review.save
      redirect_to restaurant_path(@review.rental.restaurant)
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy
    redirect_to restaurant_path(@review.rental.restaurant)
  end
  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

end
