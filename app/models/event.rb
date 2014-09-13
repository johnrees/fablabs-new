class Event < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  validates :creator, :name, :description, :starts_at,
    :ends_at, presence: true

  def to_s
    name
  end

  include Workflow
  workflow do
    state :new do
      event :publish, :transitions_to => :published
    end
    state :published do
      event :cancel, :transitions_to => :cancelled
    end
    state :cancelled
  end

end
