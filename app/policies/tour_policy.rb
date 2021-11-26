class TourPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.tour_guide
  end

  def destroy?
    user.tour_guide
  end

  def show?
    true
  end

  def change_tour_status?
    user.tour_guide
  end
end
