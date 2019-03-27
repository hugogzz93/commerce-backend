FactoryBot.define do
  factory :order do
    vendor { create(:user) }
    client { create(:user) }
    address

    factory :order_with_items do
      # TODO: after create add items
    end
  end
end
