# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :user do
    first_name "Homer"
    last_name "Simpson"
    sequence(:email) { |n| "homer#{n}@springfieldnuclear.com" }
    password "duffb33r"
    password_confirmation "duffb33r"
  end

end
