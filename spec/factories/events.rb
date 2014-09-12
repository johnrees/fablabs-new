# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    association :creator, factory: :user
    name "An Event"
    description "Event Description"
    starts_at { Time.now + 1.day }
    ends_at { Time.now + 1.day + 2.hours }
  end
end
