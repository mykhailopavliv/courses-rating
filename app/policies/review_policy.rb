class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(published: true)
    end
  end

  def permitted_attributes
    %i[text user_id] if user.present?
  end

  def create?
    return false unless user.present?
    return true if user.role?('admin')
    review.course.published?
  end

  def destroy?
    return false unless user.present?
    user.role?('admin')
  end

  private

  def review
    record
  end
end
