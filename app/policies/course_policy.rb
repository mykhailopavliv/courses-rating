class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    return false unless user.present?
    true
    # true if user.role.eql?('admin')
    # user.role.eql?('user')
    # course.title.eql?('#pivorak Ruby Summer Course 2018')
  end

  def new?
    create?
  end

  def update?
    true if user.role.eql?('admin')
    user.present? && course.owner_id == user.id
  end

  def edit?
    update?
  end

  def destroy?
    true if user.role.eql?('admin')
    user.present? && course.owner_id == user.id
  end

  private

  def course
    record
  end
end
