require 'rails_helper'

RSpec.describe Lab, :type => :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }

  it "should have name for to_s" do
    lab = FactoryGirl.build(:lab, name: 'Space Lab')
    expect(lab.to_s).to eq('Space Lab')
  end

end
