require 'rails_helper'

describe UserPolicy do

  subject(:policy) { UserPolicy.new(user, user) }
  let(:user) { build_stubbed(:user) }

  context "for a visitor" do
    let(:user) { nil }
    it { is_expected.to allow(:show) }
    it { is_expected.to allow(:create) }
    it { is_expected.to allow(:new) }
    it { is_expected.to_not allow(:update) }
    it { is_expected.to_not allow(:edit) }
    it { is_expected.to_not allow(:destroy) }
  end

end
