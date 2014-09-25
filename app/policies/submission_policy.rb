class SubmissionPolicy < ApplicationPolicy

  def show?
    record.creator and user == record.creator
  end

  # def create?
  #   user
  # end

  # def update?
  #   user.is_admin_of?(record)
  # end

end
