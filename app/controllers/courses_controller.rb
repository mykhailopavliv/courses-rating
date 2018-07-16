class CoursesController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @courses = pagy(Course.all, items: 5)
  end

  def show
    course
  end

  def new
    new_course
  end

  def edit
    course
  end

  def create
    if create_course.save
      redirect_to courses_path, notice: t('.created')
    else
      render :new
    end
  end

  def update
    # binding.pry
    if course.update(course_params)
      redirect_to course_path(course), notice: t('.updated')
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
    @course = Course.friendly.find(params[:id])
  end

  def new_course
    @course = Course.new
  end

  def create_course
    @course = Course.new(course_params)
  end

  def course_params
    params
      .require(:course)
      .permit(:title, :description, :url, :rating, :slug, :city_id,
              :organization_id, :logo, tag_list: [])
  end
end
