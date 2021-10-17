FactoryBot.define do
  factory :order_request do
    visit_date          { Faker::Date.birthday }
    visit_time_id       { Faker::Number.between(from: 2, to: 17) }
    token               {"tok_abcdefghijk00000000000000000"}
  end
end
