class LabPolicy < ApplicationPolicy

  def show?
    true
  end

  def create?
    user
  end

  def update?
    user.is_admin_of?(record)
  end

end
