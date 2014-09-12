class User < ActiveRecord::Base

  has_secure_password
  validates_presence_of :email, :first_name, :last_name
  validates_uniqueness_of :email
  validates :password, length: { minimum: 6 }, allow_nil: true
  has_many :recoveries
  has_many :submissions, foreign_key: 'creator_id'
  has_many :events, foreign_key: 'creator_id'

  def to_s
    name
  end

  def name
    [first_name, last_name].join(' ')
  end

  def email_string
    "#{self} <#{self.email}>"
  end

  def recovery_key
    recoveries.last.key if recoveries.any?
  end

end
