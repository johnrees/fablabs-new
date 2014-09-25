class Submission < ActiveRecord::Base

  belongs_to :creator, class_name: 'User'
  belongs_to :lab
  validates :creator, presence: true
  validates :lab, presence: true

  def to_s
    lab.to_s
  end

  include Workflow
  workflow do
    state :new do
      event :submit, :transitions_to => :awaiting_verification
    end
    state :awaiting_verification do
      event :endorse, :transitions_to => :awaiting_review
      event :oppose, :transitions_to => :awaiting_resubmission
    end
    state :awaiting_review do
      event :review, :transitions_to => :in_review
    end
    state :in_review do
      event :accept, :transitions_to => :accepted
      event :reject, :transitions_to => :rejected
    end
    state :listed do
      event :archive, :transitions_to => :archived
    end
    state :archived do
      event :restore, :transitions_to => :listed
    end
    state :awaiting_resubmission do
      event :resubmit, :transitions_to => :awaiting_verification
    end
    state :accepted do
      event :list, :transitions_to => :listed
    end
    # state :rejected do
    #   event :suggest_changes, :transitions_to => :awaiting_changes
    # end
    state :awaiting_changes do
      event :submit_changes, :transitions_to => :awaiting_review
    end
  end

end
