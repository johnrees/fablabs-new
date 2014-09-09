class User < ActiveRecord::Base

  has_secure_password
  validates_presence_of :email, :first_name, :last_name
  validates_uniqueness_of :email

  def to_s
    name
  end

  def name
    [first_name, last_name].join(' ')
  end

end
