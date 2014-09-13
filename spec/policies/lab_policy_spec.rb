require 'spec_helper'

describe LabPolicy do

  subject(:policy) { LabPolicy.new(user, lab) }
  let(:lab) { build_stubbed(:lab) }

  context "for a visitor" do
    let(:user) { nil }
    it { is_expected.to allow(:show) }
    it { is_expected.to_not allow(:create) }
    it { is_expected.to_not allow(:new) }
    it { is_expected.to_not allow(:update) }
    it { is_expected.to_not allow(:edit) }
    it { is_expected.to_not allow(:destroy) }
  end

  context "for a user" do
    let(:user) { build_stubbed(:user) }
    it { is_expected.to allow(:show) }
    it { is_expected.to allow(:create) }
    it { is_expected.to allow(:new) }
    it { is_expected.to allow(:update) }
    it { is_expected.to allow(:edit) }
    it { is_expected.to_not allow(:destroy) }
  end

  skip "for an admin" do
    let(:user) { create(:admin) }
    it { is_expected.to permit(:show)  }
    it { is_expected.to permit(:create) }
    it { is_expected.to permit(:new) }
    it { is_expected.to permit(:update) }
    it { is_expected.to permit(:edit) }
    it { is_expected.to permit(:destroy) }
  end

end
