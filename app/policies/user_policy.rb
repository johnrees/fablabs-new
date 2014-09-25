class UserPolicy < ApplicationPolicy

  # def index?
  #   true
  # end

  def show?
    true
  end

  def create?
    !user
  end

  def update?
    user and user == record
  end

end
