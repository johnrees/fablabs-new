require 'rails_helper'

RSpec.describe Submission, :type => :model do
  it { is_expected.to belong_to(:lab) }
  it { is_expected.to belong_to(:creator) }
  it { is_expected.to validate_presence_of(:creator) }
end
