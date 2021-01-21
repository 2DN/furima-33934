FactoryBot.define do
  factory :item do
    name { 'テスト商品' }
    description { 'おいしいテスト商品' }
    category_id { 2 }
    condition_id { 2 }
    delivery_fee_id { 2 }
    prefecture_id { 2 }
    days_taken_id { 2 }
    price { 1000 }
    association :user

    after(:build) do |item|
      item.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
