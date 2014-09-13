class EventPolicy < ApplicationPolicy

  def show?
    true
  end

  def create?
    user
  end

  def update?
    user == record.creator
  end

end
