class ReviewsController < ApplicationController
  before_action :set_course

  def create
    @review = @course.reviews.build(review_params)
    @review.author = current_user
    if @review.save
      flash[:notice] = t('.created')
    else
      flash[:alert] = t('reviews.all.error')
    end
    redirect_to course_path(@course)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to course_path(@course), notice: t('.destroyed')
  end

  private

  def review_params
    params.require(:review).permit(:text)
  end

  def set_course
    @course = Course.friendly.find(params[:course_id])
  end
end
