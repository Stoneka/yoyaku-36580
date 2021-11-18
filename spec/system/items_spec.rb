require 'rails_helper'

RSpec.describe "Items", type: :system do
  before do
    @item = FactoryBot.build(:item)
  end
#商品管理機能の結合テストコード記述
context '商品の新規登録ができるとき' do
  it '正しい情報を入力すれば商品の新規登録ができる' do
     #トップページに移動する
     visit root_path
     #トップページに新規登録ページに遷移するボタンがあることを確認する
     #管理者でログインする
     expect(page).to have_content('新規登録')
     #商品管理ページへ移動する
     ##visit new_customer_registration_path
     #商品情報を入力する
     #新規登録ボタンを押すとアイテムモデルのカウントが1上がることを確認する
     ##expect{
     ##  find('input[name="commit"]').click
     ##}.to change { Customer.count }.by(1)
     #トップページへ遷移したことを確認する
     ##expect(current_path).to eq(root_path)
     #ログアウトボタンが表示されていることを確認する
     ##expect(page).to have_content('ログアウト')
     #新規登録ページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
     ##expect(page).to have_no_content('新規登録')
     ##expect(page).to have_no_content('ログイン')
     end
  end
end
#異常系