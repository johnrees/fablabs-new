class Lab < ActiveRecord::Base

  resourcify
  has_one :submission
  belongs_to :creator, class_name: 'User'

  validates :name, :description, :creator, presence: true

  before_create :make_submission

  def make_submission
    build_submission(creator: creator)
  end

  def to_s
    name
  end

  include Workflow
  workflow do
    state :new
    state :accepted
  end

end
