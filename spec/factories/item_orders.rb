FactoryBot.define do
  factory :item_order do
    postal_code {'123-4567'}
    prefecture_id {2}
    area {'仙台市'}
    address {'青葉山123'}
    building {"東北大学"}
    phone {'08012345678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end