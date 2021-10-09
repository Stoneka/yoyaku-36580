FactoryBot.define do
  factory :item do
    item_name          { Faker::Name.initials(number: 2) }
    explanation        { Faker::Types.rb_string }
    size_id            { Faker::Number.between(from: 2, to: 6) }
    price              { Faker::Number.between(from: 1, to: 99_999) }
    calorie            { Faker::Number.between(from: 0, to: 9_999) }
    protein            { Faker::Number.between(from: 0, to: 9_999) }
    fat                { Faker::Number.between(from: 0, to: 9_999) }
    salt               { Faker::Number.between(from: 0, to: 9_999) }
    carb               { Faker::Number.between(from: 0, to: 9_999) }
    after(:build) do |sample|
      sample.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end