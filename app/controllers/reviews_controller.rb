class ReviewsController < ApplicationController
  before_action :find_review, only: [:show]
  def new
    @review = Review.new
    @pairing = Pairing.find(params[:pairing_id])
  end

  def create
    @pairing = Pairing.find_by(id: params[:pairing_id])

    unless @pairing
      flash[:alert] = "Pairing not found."
      redirect_to root_path
      return
    end

    @review = @pairing.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to new_pairing_review_path, notice: 'Review was successfully created.'
    else
      flash.now[:alert] = @review.errors.full_messages.to_sentence
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
