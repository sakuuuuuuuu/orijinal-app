FactoryBot.define do
  factory :form_object do
    zip { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    street { '渋谷区' }
    phone { '09012345678' }
    # user_id { 1 }
    # item_id { 1 }
    token { 'token123' }

    
  end
end

