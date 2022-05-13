FactoryBot.define do
  factory :order_shipping do
    token { 'tok_abcdefghijk00000000000000000' }
    post_code { '123-4567' }
    prefecture_id { Faker::Number.within(range: 2..48) }
    city { '東京都' }
    address { '1-1' }
    building { 'ユーキパレス' }
    telephone { '09012345678' }
  end
end
