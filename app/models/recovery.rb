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
