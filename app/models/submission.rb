class Submission < ActiveRecord::Base
  belongs_to :creator, class: 'User'
  validates :creator, presence: true
  belongs_to :lab
end
