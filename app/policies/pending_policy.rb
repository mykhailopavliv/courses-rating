class PendingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.where(published: false) if user.present? && user.role?('admin')
      scope.none
    end
  end

  def change_status?
    user.present? && user.role?('admin')
  end
end
