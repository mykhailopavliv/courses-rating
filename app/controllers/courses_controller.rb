class CoursesController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @courses = pagy(policy_scope(Course.published.includes(:logo_attachment)), items: 5)
    search_by_params if course_params.present?
  end

  def show
    course
  end

  def new
    @course = authorize Course.new
  end

  def edit
    course
  end

  def create
    @course = authorize Course.new(course_params)
    @course.owner_id = current_user.id
    if @course.save
      redirect_to courses_path, notice: t('.created')
    else
      render :new
    end
  end

  def update
    if course.update(course_params)
      params[:id] = course.slug
      redirect_to course, notice: t('.updated')
    else
      render :edit
    end
  end

  def destroy
    course.destroy
    redirect_to courses_path, notice: t('.destroyed')
  end

  private

  def course
    @course = authorize Course.friendly.find(params[:id])
  end

  def search_by_params
    @pagy, @courses = pagy(SearchCourseQuery.new(course_params).call, items: 5)
  end

  def course_params
    course_params = params[:course]
    course_params ? course_params.permit(:title, :city_id, :organization_id, tag_list: []) : {}
  end
end
