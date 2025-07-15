# frozen_string_literal: true

# This policy allows a user to destroy a mech if they are authorized.
class MechPolicy < ApplicationPolicy
  def destroy?
    user.present? && user.admin?
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
