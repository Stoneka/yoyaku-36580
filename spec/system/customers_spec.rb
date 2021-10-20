require 'rails_helper'

RSpec.describe "顧客情報管理機能", type: :system do
  before do
    @customer = FactoryBot.build(:customer)
  end
  context 'カスタマー新規登録ができるとき' do
    it '正しい情報を入力すればカスタマー新規登録ができてトップページに移動する' do
    #トップページに移動する
    visit root_path
    #トップページに新規登録ページに遷移するボタンがあることを確認する
    expect(page).to have_content('新規登録')
    #新規登録ページへ移動する
    visit new_customer_registration_path
    #カスタマー情報を入力する
    fill_in 'email', with: @customer.email
    fill_in 'password', with: @customer.password
    fill_in 'password-confirmation', with: @customer.password_confirmation
    fill_in 'last-name', with: @customer.last_name
    fill_in 'first-name', with: @customer.first_name
    fill_in 'last-name-kana', with: @customer.last_name_kana
    fill_in 'first-name-kana', with: @customer.first_name_kana
    fill_in 'phone-number', with: @customer.phone
    fill_in 'customer_birthday_1i', with: 1930
    fill_in 'customer_birthday_2i', with: 1
    fill_in 'customer_birthday_3i', with: 1
    #新規登録ボタンを押すとカスタマーモデルのカウントが1上がることを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { Customer.count }.by(1)
    #トップページへ遷移したことを確認する
    expect(current_path).to eq(root_path)
    #ログアウトボタンが表示されていることを確認する
    expect(page).to have_content('ログアウト')
    #新規登録ページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
    expect(page).to have_no_content('新規登録')
    expect(page).to have_no_content('ログイン')
    end
    #visitでエラー発生、要解決
  end
  context 'カスタマーが新規登録できないとき' do
    it '誤った情報を入力すればカスタマー新規登録ができず新規登録ページに戻される' do
    #トップページに移動する
    visit root_path
    #トップページに新規登録ページに遷移するボタンがあることを確認する
    expect(page).to have_content('新規登録')
    #新規登録ページへ移動する
    visit new_customer_registration_path
    #カスタマー情報を入力する
    ##fill_in 'email', with: ""
    ##fill_in 'password', with: ""
    ##fill_in 'password-confirmation', with: ""
    ##fill_in 'last-name', with: ""
    ##fill_in 'first-name', with: ""
    ##fill_in 'last-name-kana', with: ""
    ##fill_in 'first-name-kana', with: ""
    ##fill_in 'phone-number', with: ""
    ##fill_in 'customer_birthday_1i', with: ""
    ##fill_in 'customer_birthday_2i', with: ""
    ##fill_in 'customer_birthday_3i', with: ""
    #新規登録ボタンを押してもカスタマーモデルのカウントが上がらないことを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { Customer.count }.by(0)
    #新規登録ページへ戻されることを確認する
    expect(current_path).to eq new_customer_registration_path
    end
    #syntax_error要改善
  end
end
