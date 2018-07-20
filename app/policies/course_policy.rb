class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    scope.where(published: true).exists?
  end

  def show?
    return true if user.present? && user.role.eql?('admin')
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
    return true if user.role.eql?('admin')
    course.owner_id == user.id && course.published?
  end

  def edit?
    update?
  end

  def destroy?
    return false unless user.present?
    return true if user.role.eql?('admin')
    course.owner_id == user.id && course.published?
  end

  private

  def course
    record
  end
end
