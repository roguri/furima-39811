FactoryBot.define do
  factory :shipping do
    address_number {Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4)}
    region_id {Faker::Number.between(from: 2, to: 48)}
    city {Faker::Address.city}
    street_number {Faker::Address.street_address}
    building_name {Faker::Address.building_number}
    phone_number {Faker::Number.leading_zero_number(digits: 11)}
    association :purchase    
  end
end
