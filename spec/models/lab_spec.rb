require 'rails_helper'

RSpec.describe Lab, :type => :model do

  it { should have_one(:submission) }
  it { should belong_to(:creator) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }

  it "has name for to_s" do
    lab = build(:lab, name: 'Space Lab')
    expect(lab.to_s).to eq('Space Lab')
  end

  it "has default state" do
    lab = build(:lab)
    expect(lab.current_state).to eq(:new)
  end


end
