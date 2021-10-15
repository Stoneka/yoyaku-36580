FactoryBot.define do
  factory :cart_reserve do
    quantity  { Faker::Number.between(from: 1, to: 9) }
    message   { Faker::Types.rb_string }
    honorific { Faker::Name.initials(number: 2) }
    use_case  { Faker::Name.initials(number: 2) }
  end
end
