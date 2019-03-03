require 'ffaker'

FactoryBot.define do
  factory :product do
    user
    category
    name { FFaker::Product.product_name }
  end
end
