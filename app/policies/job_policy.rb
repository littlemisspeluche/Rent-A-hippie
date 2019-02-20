class JobPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
  true
  end

  def show?
  true
  end

  def create?
  true
  end

  def edit?
  record.user == user
  end

  def update?
  record.user == user
  end

  def destroy?
  record.user == user
  end

  def showing?
    record.user != user
  end

  def myjobs?
    true
  end

end
