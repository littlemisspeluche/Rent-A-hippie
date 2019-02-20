class BookingPolicy < ApplicationPolicy
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
  record.user == user || record.job.user == user

  end

  def update?
  record.user == user || record.job.user == user
  end

  def destroy?
  record.user == user
  end

  def confirmed?
    if record.status == "0"
      true
    elsif record.status == "pending"
      user.confirmed == false
    end
  end
end
