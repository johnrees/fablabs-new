require 'rails_helper'

describe User, type: :model do

  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_uniqueness_of :email }
  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.to validate_presence_of :last_name }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to ensure_length_of(:password).is_at_least(6) }
  it { is_expected.to have_many(:recoveries) }
  it { is_expected.to have_many(:submissions) }
  it { is_expected.to have_many(:events) }
  it { is_expected.to have_many(:labs) }


  it "is not superadmin" do
    user = create(:user)
    expect(user.is_superadmin?).to be_falsey
  end

  it "is superadmin" do
    superadmin = create(:superadmin)
    expect(superadmin.is_superadmin?).to be_truthy
  end

  it "has name for to_s" do
    user = build(:user, first_name: 'Homer', last_name: 'Simpson')
    expect(user.to_s).to eq('Homer Simpson')
  end

  it "has email_string" do
    user = build(:user, first_name: "Bill", last_name: "Gates", email: "bill@microsoft.com")
    expect(user.email_string).to eq('Bill Gates <bill@microsoft.com>')
  end

  it "has recovery_key" do
    user = create(:user)
    expect(user.recovery_key).to be_blank
    recovery1 = create(:recovery, email: user.email)
    expect(user.recovery_key).to eq(recovery1.key)
    recovery2 = create(:recovery, email: user.email)
    expect(user.recovery_key).to eq(recovery2.key)
  end

end
