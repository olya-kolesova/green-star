class TradePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.email == "charles@greenstarrecruitment.co.uk" || user.email == "milo@greenstarrecruitment.co.uk"
  end

  def destroy?
    user.email == "charles@greenstarrecruitment.co.uk" || user.email == "milo@greenstarrecruitment.co.uk"
  end
end
