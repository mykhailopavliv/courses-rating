# frozen_string_literal: true

class SearchCourseQuery
  delegate :city_id, :organization_id, :title, :tag_list, to: :tags_receive

  def initialize(params, relation = Course.all)
    @params = params
    @relation = relation
  end

  def call
    relation
      .where('title ILIKE ?', "%#{title}%")
      .where('city_id::text LIKE ?', "%#{city_id}%")
      .where('organization_id::text LIKE ?', "%#{organization_id}%")
      .tagged_with(tag_list, any: true, wild: true)
  end

  private

  attr_reader :params, :relation

  def tags_receive
    @tags_receive ||= SearchCourse::TagReceive.new(params)
  end
end
