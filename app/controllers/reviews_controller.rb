class ReviewsController < ApplicationController
  before_action :find_review, only: [:show]
  def new
    @review = Review.new
    @pairing = Pairing.find(params[:pairing_id])
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to new_pairing_review_path
    else
      flash[:alert] = "Review not saved."
      render :new
    end
  end

  def show
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
