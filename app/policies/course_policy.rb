class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.all if user.present? && user.role.eql?('admin')
      scope.where(published: true)
    end
  end

  def permitted_attributes_for_index
    [:title, :city_id, :organization_id, tag_list: []] || []
  end

  def permitted_attributes_for_create
    user.present? ? default_course_attributes << :owner_id : []
  end

  def permitted_attributes_for_update
    return [] unless user.present?
    return default_course_attributes << :owner_id if user.role?('admin')
    course.owner_id == user.id ? default_course_attributes : []
  end

  def index?
    show?
  end

  def show?
    return true if user.present? && user.role?('admin')
    scope.where(published: true).exists?
  end

  def create?
    return false unless user.present?
    true
  end

  def new?
    create?
  end

  def update?
    return false unless user.present?
    return true if user.role?('admin')
    course.owner_id == user.id && course.published?
  end

  def edit?
    update?
  end

  def destroy?
    return false unless user.present?
    return true if user.role?('admin')
    course.owner_id == user.id && course.published?
  end

  private

  def course
    record
  end

  def default_course_attributes
    [:title, :description, :url, :rating, :city_id, :organization_id, :logo, tag_list: []]
  end
end
