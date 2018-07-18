class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    !user.role.eql?('user')
  end

  private

  def course
    record
  end
end
