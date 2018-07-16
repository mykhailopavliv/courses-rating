class ReviewsController < ApplicationController
  before_action :set_course

  def create
    @review = @course.reviews.build(review_params)
    @review.author = current_user
    if @review.save
      redirect_to course_path(@course), notice: 'Thank you for your review.'
    else
      redirect_to course_path(@course), alert: "#{@review.errors}"
    end
  end

  def destroy
    @review = @course.reviews.find(params[:id])
    @review.destroy
    redirect_to course_path(@course), alert: 'Error'
  end

  private

  def review_params
    params.require(:review).permit(:text, :user_id)
  end

  def set_course
    @course = Course.friendly.find(params[:course_id])
  end
end
