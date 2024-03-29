require 'rails_helper'

RSpec.describe Lab, :type => :model do

  it { is_expected.to have_one(:submission) }
  it { is_expected.to belong_to(:creator) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:creator) }

  skip "has make_submission" do
    lab = build(:lab)
    lab.make_submission
    expect(lab.creator.submissions).to_not be_empty

  end

  it "has name for to_s" do
    lab = build(:lab, name: 'Space Lab')
    expect(lab.to_s).to eq('Space Lab')
  end

  it "has default state" do
    lab = build(:lab)
    expect(lab.current_state).to eq(:new)
  end

end
