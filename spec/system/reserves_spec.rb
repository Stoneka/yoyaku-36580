require 'rails_helper'

RSpec.describe "Reserves", type: :system do
  before do
    @customer = FactoryBot.create(:customer)
    @item = FactoryBot.create(:item)
    @cart = FactoryBot.create(:cart)
    @reserve = FactoryBot.built(:reserve)
  end
  context '商品の予約ができるとき' do
    it '正しい情報を入力すれば商品が予約できる' do
      
    end
  end
  context '商品の予約ができないとき' do
    it '誤った情報を入力すれば商品は予約できない' do
      
    end
  end
  context '商品の予約を管理することができる' do
    it 'すでに商品が予約されていれば予約管理ページから予約を確認することができる' do
      
    end
  end
end
