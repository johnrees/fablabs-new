class Submission < ActiveRecord::Base
  belongs_to :creator, class: 'User'
  validates_presence_of :creator
  belongs_to :lab
end
