class ReviewsController < ApplicationController
  def create
<<<<<<< HEAD
    @review        = @course.reviews.build(review_params)
=======
    @review = course.reviews.build(review_params)
>>>>>>> 483579c5355a987944b02b5192ba7c0508c6e341
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
<<<<<<< HEAD
    @review = @course.reviews.find(params[:id])
    authorize @review

=======
    @review = Review.find(params[:id])
>>>>>>> 483579c5355a987944b02b5192ba7c0508c6e341
    @review.destroy
    redirect_back(fallback_location: course_path(course))
    flash[:notice] = t('.destroyed')
  end

  private

  def review_params
<<<<<<< HEAD
    permitted_attributes(Review)
    # params.require(:review).permit(:text, :user_id)
=======
    params.require(:review).permit(:text)
>>>>>>> 483579c5355a987944b02b5192ba7c0508c6e341
  end

  def course
    @course = Course.friendly.find(params[:course_id])
  end
end
