class ReviewsController < ApplicationController
  before_action :find_review, only: [:show]
  def new
    @review = Review.new
    @pairing = Pairing.find(params[:pairing_id])
  end

  def create
    @pairing = Pairing.find(params[:pairing_id])

    unless @pairing
      flash[:alert] = "Pairing not found."
      redirect_to root_path
      return
    end

    @review = @pairing.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @pairing, notice: 'Review was successfully created.'
    else
      flash.now[:alert] = @review.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
  end

  # def destroy
  #   begin
  #     @pairing = Pairing.find(params[:pairing_id])
  #     @review = @pairing.reviews.find(params[:id])
  #     # Add authorization logic here if needed

  #   @review.destroy
  #   redirect_to @pairing, notice: 'Review was successfully deleted.'
  #   rescue ActiveRecord::RecordNotFound
  #     redirect_to @pairing, alert: 'Review not found.'
  #   end
  # end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
