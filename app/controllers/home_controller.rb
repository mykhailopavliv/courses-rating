class HomeController < ApplicationController
  include Pagy::Backend

  def index
    courses
    search_by_params if course_params.present?
  end

  private

  def courses
    @pagy, @courses = pagy(Course.all, items: 5)
  end

  def search_by_params
    @pagy, @courses = pagy(SearchCourseQuery.new(course_params).call, items: 5)
  end

  def course_params
    course_params = params[:course]
    course_params ? course_params.permit(:title, :city_id, :organization_id, tag_list: []) : {}
  end
end
