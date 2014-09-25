# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lab do
    association :creator, factory: :user
    name "MyString"
    description "MyText"
  end
end
