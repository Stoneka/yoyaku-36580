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
end