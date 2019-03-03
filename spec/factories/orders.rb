FactoryBot.define do
  factory :order do
    vendor { create(:user) }
    client { create(:user) }
  end
end
