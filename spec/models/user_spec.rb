require 'spec_helper'

describe User, type: :model do
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }

  it "should have name for to_s" do
    user = FactoryGirl.build(:user, first_name: 'Homer', last_name: 'Simpson')
    expect(user.to_s).to eq('Homer Simpson')
  end

end
