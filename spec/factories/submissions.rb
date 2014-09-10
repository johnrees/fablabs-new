# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :submission do
    creator nil
    workflow_state "MyString"
    notes "MyText"
  end
end
