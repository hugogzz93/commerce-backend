FactoryBot.define do
  factory :order_item do
    product
    order
    amount { 1 }
  end
end
