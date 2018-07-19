class Courses::PendingController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @courses = pagy(Course.unpublished, items: 5)
  end

  def change_status
    course.toggle!(:published)
    redirect_to pending_courses_path, notice: 'Course was approved'
  end

  private

  def course
    @course = Course.friendly.find(params[:id])
  end
end
