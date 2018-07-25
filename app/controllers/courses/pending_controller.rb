class Courses::PendingController < ApplicationController
  include Pagy::Backend

  def index
    unpublished_courses = policy_scope(Course, policy_scope_class: PendingPolicy::Scope)
    @pagy, @courses = pagy(unpublished_courses, items: 10)
  end

  def change_status
    authorize :pending
    course.toggle!(:published)
    redirect_to pending_courses_path, notice: t('courses.all.approved')
  end

  private

  def course
    @course = Course.friendly.find(params[:id])
  end
end
