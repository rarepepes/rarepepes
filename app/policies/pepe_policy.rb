class PepePolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    user.present?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
