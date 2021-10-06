class TeamMemberPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.email == "charles@greenstarrecruitment.co.uk"
  end

  def update?
    user.email == "charles@greenstarrecruitment.co.uk" || record.user == user
  end

  def destroy?
    user.email == "charles@greenstarrecruitment.co.uk"
  end
end
