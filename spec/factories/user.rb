FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'test1234TEST'} 
    password_confirmation {password}
    last_name             {'あいうえお'}
    first_name            {'あいうえお'}
    last_name_kana        {'アイウエオ'}
    first_name_kana       {'アイウエオ'}
    birth_day             {Faker::Date.birthday}
  end
end