class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    # !user.role.eql?('user')
    course.title.eql?('#pivorak Ruby Summer Course 2018')
  end

  def edit?
    # course.user.role.eql?('user')
    course.owner_id == 2
  end

  def update?
    false
  end

  private

  def course
    record
  end
end
