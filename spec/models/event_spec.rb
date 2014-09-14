require 'rails_helper'

RSpec.describe Event, :type => :model do

  it { is_expected.to belong_to(:creator) }
  it { is_expected.to validate_presence_of(:creator) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:starts_at) }
  it { is_expected.to validate_presence_of(:ends_at) }

  it "validates ends_at > starts_at" do
    event = build(:event, starts_at: 1.hour.from_now, ends_at: Time.now)
    expect(event).to be_invalid
  end

  it "has name for to_s" do
    event = build(:event, name: 'Space Event')
    expect(event.to_s).to eq('Space Event')
  end

  it "has default state" do
    event = build(:event)
    expect(event.current_state).to eq(:new)
  end

end
