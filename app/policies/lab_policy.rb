class LabPolicy < ApplicationPolicy

  def show?
    true
  end

  def create?
    user
  end

  def update?
    user
  end

end
