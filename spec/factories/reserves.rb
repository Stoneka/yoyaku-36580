FactoryBot.define do
  factory :reserve do
    quantity  { Faker::Number.between(from: 1, to: 9) }
    message   { Faker::Types.rb_string }
    honorific { Faker::Name.initials(number: 2) }
    use_case  { Faker::Name.initials(number: 2) }
    association :customer
    association :item
    association :cart
  end
end
