FactoryBot.define do
  factory :customer do
    email                 { Faker::Internet.free_email }
    password = 'abc123'
    password              { password }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birthday              { Faker::Date.birthday }
    phone                 { '12345678901'}
  end
  factory :user_master, class: Customer do
    email                 { 'user@master.jp' }
    password = '00000a'
    password              { password }
    password_confirmation { password }
    last_name             { 'ユーザー' }
    first_name            { 'ユーザー' }
    last_name_kana        { 'ユーザー' }
    first_name_kana       { 'ユーザー' }
    birthday              { Faker::Date.birthday }
    phone                 { '12345678901' }
    admin                 { true }
  end
  factory :test_customer, class: Customer do
    email                 { 'test@test' }
    password = '00000a'
    password              { password }
    password_confirmation { password }
    last_name             { 'テスト' }
    first_name            { 'テスト' }
    last_name_kana        { 'テスト' }
    first_name_kana       { 'テスト' }
    birthday              { Faker::Date.birthday }
    phone                 { '12345678901' }
    admin                 { false }
  end
end