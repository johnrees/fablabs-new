# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :submission do
    association :creator, factory: :user
    lab
    workflow_state "MyString"
    notes "MyText"
  end
end
