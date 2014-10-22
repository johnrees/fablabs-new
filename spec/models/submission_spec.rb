require 'rails_helper'

RSpec.describe Submission, :type => :model do

  it { is_expected.to belong_to(:lab) }
  it { is_expected.to belong_to(:creator) }
  it { is_expected.to validate_presence_of(:creator) }
  it { is_expected.to validate_presence_of(:lab) }

  it "has lab name as to_s" do
    lab = create(:lab, name: 'test lab')
    submission = create(:submission, lab: lab)
    expect(submission.to_s).to eq('test lab')
  end

  it "has name for to_s" do
    submission = build(:submission)
    expect(submission.current_state).to eq(:new)
  end

end
