FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    # nickname              {'test'}
    # email                 {'test@example'}
    password              {'0aaaaaaa'}
    password_confirmation {password}
    name_last             {'あぁ'} 
    name_first            {'あぁ'}
    name_last_kana        {'アァ'}
    name_first_kana       {'アァ'}
    birth_day             {'1900-1-1'}     
  end
end
