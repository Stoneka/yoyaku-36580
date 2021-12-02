require 'rails_helper'

RSpec.describe "Reserves", type: :system do
  before do
    @test_customer = FactoryBot.create(:test_customer)
    @item = FactoryBot.create(:item)
    @cart = FactoryBot.create(:cart)
    @reserve = FactoryBot.build(:reserve)
  end
  context '商品の予約ができるとき' do
    it '正しい情報を入力すれば商品が予約できる' do
      #トップページに移動する
      visit root_path
      #トップページにログインボタンが表示されていることを確認する
      expect(page).to have_content('ログイン')
      #ログインページへ移動する
      visit new_customer_session_path
      #管理者でログインする
      fill_in 'email', with: 'test@test'
      fill_in 'password', with: '00000a'
      find('input[name="commit"]').click
      #トップページに遷移したことを確認する
      expect(current_path).to eq(root_path)
      #既に商品が登録されていることを確認する
      expect(page).to have_content(@item.item_name)
      #商品の詳細ページへのリンクがあることを確認する
      #リンクの確認方法、要改善
      expect(all('.list')[0]).to have_link , href:item_path(@item.id)
      #商品の詳細ページへ移動する
      visit item_path(@item.id)
      #予約フォームに予約情報を入力する
      fill_in 'quantity', with: @reserve.quantity
      fill_in 'message', with: @reserve.message
      choose 'cart_reserve_honorific_さん'
      choose 'cart_reserve_use_case_お誕生日おめでとう'
      #カートへ入れるボタンを押すとreserveモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Reserve.count }.by(1)
    end
  end
  context '商品の予約ができないとき' do
    it '誤った情報を入力すれば商品は予約できない' do
      #トップページに移動する
      visit root_path
      #トップページにログインボタンが表示されていることを確認する
      expect(page).to have_content('ログイン')
      #ログインページへ移動する
      visit new_customer_session_path
      #管理者でログインする
      fill_in 'email', with: 'test@test'
      fill_in 'password', with: '00000a'
      find('input[name="commit"]').click
      #トップページに遷移したことを確認する
      expect(current_path).to eq(root_path)
      #既に商品が登録されていることを確認する
      expect(page).to have_content(@item.item_name)
      #商品の詳細ページへのリンクがあることを確認する
      #リンクの確認方法、要改善
      expect(all('.list')[0]).to have_link , href:item_path(@item.id)
      #商品の詳細ページへ移動する
      visit item_path(@item.id)
      #予約フォームに予約情報を入力する
      fill_in 'quantity', with: ''
      fill_in 'message', with: ''
      choose 'cart_reserve_honorific_さん'
      choose 'cart_reserve_use_case_お誕生日おめでとう'
      #カートへ入れるボタンを押すとreserveモデルのカウントが上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Reserve.count }.by(0)
    end
  end
  context '商品の予約を管理することができる' do
    it 'すでに商品が予約されていれば予約管理ページから予約を確認することができる' do
      #トップページに移動する
      visit root_path
      #管理者アカウントでログインできていない。一旦ログアウトの操作をしてから再度管理者アカウントでログインする記述が必要
      #トップページにログアウトボタンが表示されていることを確認する
      #ログアウトボタンのリンクを確認し、ログアウトボタンをクリックする
      #ログアウトが完了したことを確認する
      #トップページに移動する
      #トップページにログインボタンが表示されていることを確認する
      expect(page).to have_content('ログイン')
      #ログインページへ移動する
      visit new_customer_session_path
      #管理者でログインする
      fill_in 'email', with: 'test@test'
      fill_in 'password', with: '00000a'
      find('input[name="commit"]').click
      #トップページに遷移したことを確認する
      expect(current_path).to eq(root_path)
      #予約管理ページへのリンクがあることを確認する
      expect(page).to have_link '予約管理', href:reserve_path
      #予約管理ページに移動する
      visit reserve_path
      #商品の予約情報が表示されていることを確認する
      expect(page).to have_content('予約済商品一覧')
    end
  end
end
