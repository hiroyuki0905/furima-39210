FactoryBot.define do
  factory :order_form do
    association :user
    association :item

    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    house_number { '1-2-3' }
    building { 'ビル名' }
    phone_number { '09012345678' }

    after(:build) do |order_form|
      order_form.item = FactoryBot.build(:item)
    end
  end
end
