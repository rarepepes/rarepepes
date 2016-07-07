class PepePolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    user.present?
  end

  def destroy?
    record.user == user || user.try(:admin?)
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
