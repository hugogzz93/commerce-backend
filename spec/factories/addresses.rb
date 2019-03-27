require 'ffaker'

FactoryBot.define do
  factory :address do
    country { FFaker::Address.name}
    full_name { FFaker::Name.name }
    street1 { FFaker::Address.street_address }
    street2 { FFaker::Address.secondary_address }
    city { FFaker::Address.city  }
    zip { FFaker::AddressUS.zip_code}
    phone {FFaker::PhoneNumber.short_phone_number }
    security_code { ((1..3).map { rand(0..9) }).join }
    instructions {}
    user
  end
end
