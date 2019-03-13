FactoryBot.define do
  factory :order do
    vendor { create(:user) }
    client { create(:user) }

    factory :order_with_items do
      order_items { [ create(:order_item) ]}
    end
  end
end
