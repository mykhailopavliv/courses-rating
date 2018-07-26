class Reviews::PendingController < ApplicationController
  include Pagy::Backend

  def index
    unpublished_courses = policy_scope(Review, policy_scope_class: PendingPolicy::Scope)
    @pagy, @reviews = pagy(unpublished_courses, items: 10)
  end

  def change_status
    authorize :pending
    review.toggle!(:published)
    redirect_to pending_reviews_path, notice: t('reviews.all.approved')
  end

  private

  def review
    @review = Review.find(params[:pending_review_id])
  end
end
