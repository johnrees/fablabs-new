require 'rails_helper'

RSpec.describe Role, :type => :model do
  it { is_expected.to belong_to(:resource) }
  it { is_expected.to have_and_belong_to_many(:users) }
end
