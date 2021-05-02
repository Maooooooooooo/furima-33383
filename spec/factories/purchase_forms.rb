FactoryBot.define do
  factory :purchase_form do
    postal_cord       {'000-0000'}
    prefecture_id     {2}
    city              {'テスト市'}
    word              {'テスト1-1'}
    phone_number      {'00000000000'}
    token             {'sk_test_aiueo000000000'}
    building          {'テスト'}
  end
end
