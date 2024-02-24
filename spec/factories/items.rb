FactoryBot.define do
  factory :item do
    title {Faker::Lorem.sentence}
    item_information {Faker::Lorem.sentence}
    price {Faker::Number.between(from: 300, to: 9_999_999)}
    category_id {Faker::Number.between(from: 2, to: 11)}
    condition_id {Faker::Number.between(from: 2, to: 7)}
    shipping_cost_id {Faker::Number.between(from: 2, to: 3)}
    shipping_date_id {Faker::Number.between(from: 2, to: 4)}
    region_id {Faker::Number.between(from: 2, to: 48)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
