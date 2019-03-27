require 'ffaker'

FactoryBot.define do
  factory :user do
    name { FFaker::Name.name }
    email { FFaker::Internet.disposable_email }
    password '1234'
    after(:create) do |user, evaluator|
      create :address, user: user, full_name: user.name
    end
  end
end
