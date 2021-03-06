require 'rails_helper'

RSpec.describe "Items", type: :system do
  before do
    @item = FactoryBot.build(:item)
    @user_master = FactoryBot.create(:user_master)
    #管理者アカウントをデータベースに登録
  end
#商品管理機能の結合テストコード記述
  context '商品の新規登録ができるとき' do
    it '正しい情報を入力すれば商品の新規登録ができる' do
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
      attach_file "item_image_id", "app/assets/images/cake_1.jpg"
      fill_in 'item-name', with: @item.item_name
      fill_in 'item-info', with: @item.explanation
      select '4号サイズ(直径12cm)', from: 'item-category'
      fill_in 'item[price]', with: @item.price
      fill_in 'item[calorie]', with: @item.calorie
      fill_in 'item[protein]', with: @item.protein
      fill_in 'item[fat]', with: @item.fat
      fill_in 'item[carb]', with: @item.carb
      fill_in 'item[salt]', with: @item.salt
      #商品を登録するボタンを押すとアイテムモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Item.count }.by(1)
      #トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
      #新たに登録した商品が表示されていることを確認する
      expect(page).to have_content(@item.item_name)
    end
    it '既に商品が登録されていれば商品管理ページに登録されている商品が表示される' do
      #事前に商品を登録する
      @item = FactoryBot.create(:item)
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
      #商品が表示されていることを確認する
      expect(page).to have_content(@item.item_name)
    end
    it '既に商品が登録されていれば商品管理ページから商品情報を編集することができる' do
      #事前に商品を登録する
      @item = FactoryBot.create(:item)
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
      #商品が表示されていることを確認する
      expect(page).to have_content(@item.item_name)
      #商品を編集するボタンがあることを確認する
      expect(page).to have_link '商品の編集', href: edit_item_path(@item.id)
      #商品を編集するボタンを押すと商品編集画面に移動する
      visit edit_item_path(@item.id)
      #編集する商品情報を入力する
      fill_in 'item-name', with: '編集後の商品名'
      find('input[name="commit"]').click
      #トップページに移動する
      visit root_path
      #トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
      #商品管理ページへ移動する
      visit manage_items_path
      #編集した商品が表示されていることを確認する
      expect(page).to have_content('編集後の商品名')
    end
    it '既に商品が登録されていれば商品管理ページから商品情報を削除することができる' do
      #事前に商品を登録する
      @item = FactoryBot.create(:item)
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
      #商品が表示されていることを確認する
      expect(page).to have_content(@item.item_name)
      #削除ボタンがあることを確認する
      expect(page).to have_content('削除')
      #削除ボタンを押すと商品が削除されレコードの数が1減ることを確認する
      expect{
        page.find_link('削除', href: item_path(@item.id)).click
      }.to change { Item.count }.by(-1)
      ##トップページに移動する
      #visit root_path
      #トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
      #商品管理ページへ移動する
      visit manage_items_path
      #削除した商品が表示されていないことを確認する
      expect(page).to have_no_content(@item.item_name)
    end
  end
  context '商品の新規登録ができないとき' do
    it '誤った情報を入力すれば商品の新規登録ができず新規登録ページに移動する' do
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
      #画像のアップロードのテストを要追記
      #attach_file "item_image_id", ""
      fill_in 'item-name', with: ""
      fill_in 'item-info', with: ""
      select '--', from: 'item-category'
      fill_in 'item[price]', with: ""
      fill_in 'item[calorie]', with: ""
      fill_in 'item[protein]', with: ""
      fill_in 'item[fat]', with: ""
      fill_in 'item[carb]', with: ""
      fill_in 'item[salt]', with: ""
      #商品を登録するボタンを押すとアイテムモデルのカウントが上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Item.count }.by(0)
      #商品の新規登録ページに遷移したことを確認する
      expect(current_path).to eq(items_path)
    end
  end
end