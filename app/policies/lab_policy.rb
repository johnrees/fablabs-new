class LabPolicy < ApplicationPolicy

  def show?
    true
  end

  def create?
    user
  end

  def update?
    record.creator.present? and user == record.creator
  end

end
