require 'spec_helper'

describe EventPolicy do

  subject(:policy) { EventPolicy.new(user, event) }
  let(:event) { build_stubbed(:event) }

  context "for a visitor" do
    let(:user) { nil }
    it { is_expected.to allow(:show) }
    it { is_expected.to_not allow(:create) }
    it { is_expected.to_not allow(:new) }
    it { is_expected.to_not allow(:update) }
    it { is_expected.to_not allow(:edit) }
    it { is_expected.to_not allow(:destroy) }
  end

  context "for an event creator" do
    let(:user) { create(:user) }
    let(:event) { build_stubbed(:event, creator: user) }

    it { is_expected.to allow(:show) }
    it { is_expected.to allow(:create) }
    it { is_expected.to allow(:new) }
    it { is_expected.to allow(:update) }
    it { is_expected.to allow(:edit) }
    it { is_expected.to_not allow(:destroy) }
  end

end
