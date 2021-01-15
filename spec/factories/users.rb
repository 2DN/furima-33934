FactoryBot.define do
  factory :user do
    nickname { 'nao' }
    email { Faker::Internet.free_email }
    password = 'sample2021'
    password { password }
    password_confirmation { password }
    last_name_kanji { '山田' }
    first_name_kanji { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    date_of_birth { '1994-04-24' }
  end
end
