class ReviewsController < ApplicationController
  def create
    @review        = course.reviews.build(review_params)
    @review.author = current_user
    authorize @review

    if @review.save
      flash[:notice] = t('.created')
    else
      flash[:alert] = t('reviews.all.error')
    end
    redirect_to course_path(course)
  end

  def destroy
    @review = authorize course.reviews.find(params[:id])
    @review.destroy
    redirect_back(fallback_location: course_path(course))
    flash[:notice] = t('.destroyed')
  end

  private

  def review_params
    permitted_attributes(Review)
  end

  def course
    @course = Course.friendly.find(params[:course_id])
  end
end
