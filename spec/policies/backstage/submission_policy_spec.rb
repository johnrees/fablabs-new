require 'rails_helper'

describe SubmissionPolicy do

  subject(:policy) { Backstage::SubmissionPolicy.new(user, submission) }
  let(:submission) { build_stubbed(:submission) }


  context "for a superadmin" do
    let(:user) { create(:superadmin) }
    let(:submission) { build_stubbed(:submission, creator: user) }

    it { is_expected.to allow(:show) }
    it { is_expected.to_not allow(:create) }
    it { is_expected.to_not allow(:new) }
    it { is_expected.to_not allow(:update) }
    it { is_expected.to_not allow(:edit) }
    it { is_expected.to_not allow(:destroy) }
  end

end
