# frozen_string_literal: true

class SearchCourseQuery
  def initialize(params, relation = Course.published)
    @params = params
    @relation = relation
  end

  def call
    courses = SearchCourse::SearchReceive.search_by_title(relation, params[:title])
    courses = SearchCourse::SearchReceive.search_by_city_id(courses, params[:city_id])
    courses = SearchCourse::SearchReceive.search_by_org_id(courses, params[:organization_id])
    courses = SearchCourse::SearchReceive.search_by_tag_list(courses, params[:tag_list])
    courses
  end

  private

  attr_reader :params, :relation
end
