class PepePolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    user.present?
  end

  def destroy?
    user.present? && record.user == user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
