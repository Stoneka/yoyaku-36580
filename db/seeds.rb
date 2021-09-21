customer = Customer.create!(
  email: "user@master.jp"     ,
  password: "00000a"          ,
  password_confirmation: "00000a",
  last_name: "ユーザー"         ,
  first_name: "ユーザー"        ,
  last_name_kana: "ユーザー"    ,
  first_name_kana: "ユーザー"   ,
  birthday: "1930-01-01"       ,
  phone: "12345678901"         ,
  admin: true)
cart = Cart.new(
  customer_id: customer.id)
cart.save!

customer = Customer.create!(
  email: "test1@test"     ,
  password: "00000a"          ,
  password_confirmation: "00000a",
  last_name: "テストいち"         ,
  first_name: "テストいち"        ,
  last_name_kana: "テストイチ"    ,
  first_name_kana: "テストイチ"   ,
  birthday: "1930-01-01"       ,
  phone: "12345678901"         ,
  admin: false)
cart = Cart.new(
  customer_id: customer.id)
cart.save!

customer = Customer.create!(
  email: "test2@test"     ,
  password: "00000a"          ,
  password_confirmation: "00000a",
  last_name: "テストに"         ,
  first_name: "テストに"        ,
  last_name_kana: "テストニ"    ,
  first_name_kana: "テストニ"   ,
  birthday: "1930-01-01"       ,
  phone: "12345678901"         ,
  admin: false)
cart = Cart.new(
  customer_id: customer.id)
cart.save!

item = Item.new(
  id: "3",
  item_name: "イチゴのタルト",
  explanation: "イチゴを使ったタルトです",
  size_id: "2",
  price: "3000",
  calorie: "2500",
  protein: "1000",
  fat: "2000",
  salt: "150",
  carb: "250")
item.image.attach(io: File.open('app/assets/images/cake_4.jpg'), filename: 'cake_4.jpg')
item.save!

item = Item.new(
  id: "1",
  item_name: "シャルロット",
  explanation: "イチゴを使ったシャルロットケーキです",
  size_id: "3",
  price: "3500",
  calorie: "2250",
  protein: "1000",
  fat: "2000",
  salt: "150",
  carb: "250")
item.image.attach(io: File.open('app/assets/images/cake_7.jpg'), filename: 'cake_7.jpg')
item.save!

item = Item.new(
  id: "2",
  item_name: "ホワイトケーキ",
  explanation: "スポンジにフォンダンをかけました",
  size_id: "2",
  price: "2500",
  calorie: "1250",
  protein: "1000",
  fat: "2000",
  salt: "150",
  carb: "250")
item.image.attach(io: File.open('app/assets/images/cake_2.jpg'), filename: 'cake_2.jpg')
item.save!

item = Item.new(
  id: "4",
  item_name: "イチゴのムース",
  explanation: "イチゴのムースを使ったケーキです",
  size_id: "2",
  price: "2500",
  calorie: "2000",
  protein: "800",
  fat: "2000",
  salt: "150",
  carb: "250")
item.image.attach(io: File.open('app/assets/images/cake_3.jpg'), filename: 'cake_3.jpg')
item.save!

item = Item.new(
  id: "5",
  item_name: "イチゴのケーキ（小さめ）",
  explanation: "イチゴを使った小さめのケーキです",
  size_id: "2",
  price: "2250",
  calorie: "2000",
  protein: "850",
  fat: "2000",
  salt: "150",
  carb: "250")
item.image.attach(io: File.open('app/assets/images/cake_6.jpg'), filename: 'cake_6.jpg')
item.save!

item = Item.new(
  id: "6",
  item_name: "イチゴのホワイトチョコケーキ",
  explanation: "イチゴとホワイトチョコのケーキです",
  size_id: "4",
  price: "2750",
  calorie: "2550",
  protein: "1250",
  fat: "3500",
  salt: "150",
  carb: "250")
item.image.attach(io: File.open('app/assets/images/cake_8.png'), filename: 'cake_8.png')
item.save!

honorific_ary = ["ちゃん", "くん", "さん", "なし"]
use_case_ary = ["お誕生日おめでとう", "HappyBirthday", "祝", "なし"]
10.times do 
  num = Faker::Number.between(from: 0, to: 3)
  reserve = Reserve.create!(
    quantity: 1,
    message: Faker::Name.unique.last_name,
    honorific: honorific_ary[num],
    use_case: use_case_ary[num],
    customer_id: 3,
    item_id: Faker::Number.between(from: 1, to: 6),
    cart_id: 3)

  order = Order.create!(
    reserve_id: reserve.id)

  visit_date_ary = (1..11).to_a
  visit_date_ary.map! {|i| (Time.now + i.days + 1.years).strftime("%Y/%m/%d")}
  date_num = Faker::Number.between(from: 0, to: 10)
  Request.create!(
    visit_date: visit_date_ary[date_num],
    visit_time_id: Faker::Number.between(from: 2, to: 17),
    order_id: order.id)
end

10.times do 
  num = Faker::Number.between(from: 0, to: 3)
  reserve = Reserve.create!(
    quantity: 1,
    message: Faker::Name.unique.last_name,
    honorific: honorific_ary[num],
    use_case: use_case_ary[num],
    customer_id: 2,
    item_id: Faker::Number.between(from: 1, to: 6),
    cart_id: 2)

  order = Order.create!(
    reserve_id: reserve.id)

  visit_date_ary = (1..11).to_a
  visit_date_ary.map! {|i| (Time.now + i.days + 1.years).strftime("%Y/%m/%d")}
  date_num = Faker::Number.between(from: 0, to: 10)
  Request.create!(
    visit_date: visit_date_ary[date_num],
    visit_time_id: Faker::Number.between(from: 2, to: 17),
    order_id: order.id)
end