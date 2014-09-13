class RecoveryUserValidator < ActiveModel::Validator

  def validate(record)
    unless User.where(email: record.email).exists?
      record.errors[:email] << "Sorry, we can't find a user with that username or email address"
    end
  end

end
