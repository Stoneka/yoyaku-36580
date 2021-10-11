FactoryBot.define do
  factory :request do
    visit_date               { Faker::Date.birthday }
    visit_time_id            { Faker::Number.between(from: 2, to: 17) }
    association :order
  end
end
