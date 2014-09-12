class Event < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  validates_presence_of :creator, :name, :description, :starts_at, :ends_at

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
