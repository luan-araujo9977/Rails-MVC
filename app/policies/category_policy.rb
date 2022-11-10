class CategoryPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user.admin?
        scope.all
      else
        raise Pundit::NotAuthorizedError
      end
    end
  end

  def index?
    user&.admin?
  end

  def creat?
    user.admin?
  end

  def update?
    user.admin?
  end
  
  def destroy?
    user.admin?
  end
end
