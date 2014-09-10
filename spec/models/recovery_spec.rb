require 'rails_helper'

RSpec.describe Recovery, :type => :model do

  it { is_expected.to belong_to(:user) }

  it "is valid with user" do
    user = create(:user)
    expect(create(:recovery, email: user.email).user ).to be_valid
  end

  it "validates user exists on create" do
    expect{create(:recovery)}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "has to_param" do
    user = create(:user)
    recovery = create(:recovery, email: user.email)
    expect(recovery.to_param).to eq(recovery.key)
  end

  it "has find_by_key" do
    user = create(:user)
    recovery = create(:recovery, email: user.email)
    expect(Recovery.find_by_key(recovery.key).user).to eq(recovery.user)
  end

  it "associates user before_create" do
    user = create(:user)
    expect( create(:recovery, email: user.email).user ).to eq(user)
  end

  it "generates key on creation" do
    expect(create(:recovery, email: create(:user).email ).key).to be_present
  end

  it "uses key as to_param" do
    recovery = build(:recovery)
    expect(recovery.to_param).to eq(recovery.key)
  end

end
