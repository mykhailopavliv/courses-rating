class CoursesController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @courses = pagy(policy_scope(Course), items: 5)
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
    create_course.save!
    if create_course.save
      redirect_to courses_path, notice: t('.created')
    else
      render :new
    end
  end

  def update
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
    @course = authorize Course.friendly.find(params[:id])
  end

  def new_course
    @course = authorize Course.new
  end

  def create_course
    params[:course][:owner_id] = current_user.id
    @course = authorize Course.new(course_params)
  end

  def course_params
    permitted_attributes(@course || Course)
  end
end
