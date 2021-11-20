require 'rails_helper'

RSpec.describe "Items", type: :system do
  before do
    @item = FactoryBot.build(:item)
    @customer = FactoryBot.build(:customer)
  end
#商品管理機能の結合テストコード記述
context '商品の新規登録ができるとき' do
  it '正しい情報を入力すれば商品の新規登録ができる' do
    #管理者アカウトを事前にデータベースに保存する
    @customer.email = 'user@master.jp'
    @customer.password = '00000a'
    @customer.password_confirmation = @customer.password
    @customer.admin = '1'
    #管理者アカウントのデータがうまく登録できていない
    ####トップページに移動する
    ###visit root_path
    ####トップページに新規登録ページに遷移するボタンがあることを確認する
    ###expect(page).to have_content('新規登録')
    ####新規登録ページへ移動する
    ###visit new_customer_registration_path
    ####カスタマー情報を入力する
    ###fill_in 'email', with: 'user@master.jp'
    ###fill_in 'password', with: '00000a'
    ###fill_in 'password-confirmation', with: '00000a'
    ###fill_in 'last-name', with: @customer.last_name
    ###fill_in 'first-name', with: @customer.first_name
    ###fill_in 'last-name-kana', with: @customer.last_name_kana
    ###fill_in 'first-name-kana', with: @customer.first_name_kana
    ###fill_in 'phone-number', with: @customer.phone
    ###select '1930', from:'customer_birthday_1i' 
    ###select '1', from:'customer_birthday_2i'
    ###select '1', from:'customer_birthday_3i'
    ####新規登録ボタンを押すとカスタマーモデルのカウントが1上がることを確認する
    ###expect{
    ###  find('input[name="commit"]').click
    ###}.to change { Customer.count }.by(1)
    ####トップページへ遷移したことを確認する
    ###expect(current_path).to eq(root_path)
    ####ログアウトボタンが表示されていることを確認する
    ###expect(page).to have_content('ログアウト')
    ####新規登録ページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
    ###expect(page).to have_no_content('新規登録')
    ###expect(page).to have_no_content('ログイン')
     #トップページに移動する
     visit root_path
     #トップページにログインボタンが表示されていることを確認する
     expect(page).to have_content('ログイン')
     #ログインページへ移動する
     visit new_customer_session_path
     #管理者でログインする
     fill_in 'email', with: 'user@master.jp'
     fill_in 'password', with: '00000a'
     find('input[name="commit"]').click
     #トップページに遷移したことを確認する
     expect(current_path).to eq(root_path)
     #トップページに商品管理ボタンが表示されていることを確認する
     expect(page).to have_content('商品管理')
     #商品管理ページへ移動する
     visit manage_items_path
     #新規商品登録ボタンがあることを確認する
     expect(page).to have_content('新規商品登録')
     #新規商品登録画面に移動する
     visit new_item_path
     #商品情報を入力する
     fill_in 'image', with: @item.image
     fill_in 'item_name', with: @item.item_name
     fill_in 'explanation', with: @item.explanation
     select '4号サイズ(直径12cm)', from:size_id
     fill_in 'price', with: @item.price
     fill_in 'calorie', with: @item.calorie
     fill_in 'protain', with: @item.protain
     fill_in 'fat', with: @item.fat
     fill_in 'carb', with: @item.carb
     fill_in 'salt', with: @item.salt
     #商品を登録するボタンを押すとアイテムモデルのカウントが1上がることを確認する
     expect{
       find('input[name="commit"]').click
     }.to change { Item.count }.by(1)
     #トップページへ遷移したことを確認する
     expect(current_path).to eq(root_path)
     #新たに登録した商品が表示されていることを確認する
     expect(page).to have_content(@item.item_name)
     end
  end
end
#異常系