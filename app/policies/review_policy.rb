class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.all if user.present? && user.role.eql?('admin')
      scope.where(published: true)
    end
  end

  def create?
    return false unless user.present?
    return true if user.role.eql?('admin')
    review.course.published?
  end

  def destroy?
    return false unless user.present?
    user.role.eql?('admin')
  end

  private

  def review
    record
  end
end
