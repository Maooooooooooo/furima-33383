FactoryBot.define do
  factory :item do
    item_name       {Faker::Name}
    explanation     {Faker::Lorem.sentence}
    category_id{2}
    condition_id{2}
    delivery_fee_id{2}
    ship_from_area_id{2}
    prefecture_id{2}
    price   {1000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
  end
end
