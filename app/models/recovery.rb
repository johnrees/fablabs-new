class RecoveryUserValidator < ActiveModel::Validator

  def validate(record)
    unless User.where(email: record.email).exists?
      record.errors[:email] << "Sorry, we can't find a user with that username or email address"
    end
  end

end

class Recovery < ActiveRecord::Base

  include Tokenable
  include ActiveModel::Validations
  validates_with RecoveryUserValidator, on: :create

  belongs_to :user
  attr_accessor :email
  accepts_nested_attributes_for :user

  def to_param
    key
  end

  before_create :associate_user
  before_create { generate_token(:key) }

private

  def associate_user
    self.user = User.where(email: email).first
  end

end
