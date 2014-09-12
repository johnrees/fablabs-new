# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    association :creator, factory: :user
    name "An Event"
    description "Event Description"
    starts_at { 1.day.from_now }
    ends_at { 1.day.from_now + 2.hours }
  end
end
