class Reviews::PendingController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @reviews = pagy(Review.unpublished, items: 10)
  end

  def change_status
    puts params
    review.toggle!(:published)
    redirect_to pending_reviews_path, notice: 'Review was approved'
  end

  private

  def review
    @review = Review.find(params[:pending_review_id])
  end
end
