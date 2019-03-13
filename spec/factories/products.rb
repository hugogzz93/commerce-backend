require 'ffaker'

FactoryBot.define do
  factory :product do
    user
    category
    price {rand(1.0..1000.0).round(2)}
    stock {rand(1..100)}
    name { FFaker::Product.product_name }
  end
end
