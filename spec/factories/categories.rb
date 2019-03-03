require 'ffaker'

FactoryBot.define do
  factory :category do
    name { FFaker::Product.product }
  end
end
