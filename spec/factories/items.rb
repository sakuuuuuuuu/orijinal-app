FactoryBot.define do
  factory :item do
    name { "商品名"}
    explaination { "説明文"} # 例えば、説明文を生成する場合
    category_id { 2 } # カテゴリーIDに適切な値を設定
    condition_id { 2 } # 商品の状態IDに適切な値を設定
    del_fee_id { 2 } # 配送料の負担IDに適切な値を設定
    prefecture_id { 2 } # 配送元地域IDに適切な値を設定
    days_until_shipping_id { 2 } # 発送までの日数IDに適切な値を設定
    price { 1000 } # 価格を適切な値に設定
    
    

    association :user 

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/a.png'), filename: 'a.png') 
    end

  end
end
