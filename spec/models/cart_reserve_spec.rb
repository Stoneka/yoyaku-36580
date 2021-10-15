require 'rails_helper'

RSpec.describe CartReserve, type: :model do
  before do
    item = FactoryBot.create(:item)
    customer = FactoryBot.create(:customer)
    @cart_reserve = FactoryBot.build(:cart_reserve, customer_id: customer.id, item_id: item.id)
    sleep 0.3
  end

  describe '予約注文機能' do
    context '予約注文ができるとき' do
      it 'quantity,message,honorific,use_caseが存在すれば登録できる' do
        expect(@cart_reserve).to be_valid
      end
      it 'quantityが空でないかつ1~9の間であれば登録できる' do
        @cart_reserve.quantity = 1
        expect(@cart_reserve).to be_valid
      end
      it 'messageが空でなければ登録できる' do
        @cart_reserve.message = 'aaaaaa'
        expect(@cart_reserve).to be_valid
      end
      it 'honorificが空でなければ登録できる' do
        @cart_reserve.honorific = 'aaaaaa'
        expect(@cart_reserve).to be_valid
      end
      it 'use_caseが空でなければ登録できる' do
        @cart_reserve.use_case = 'aaaaaa'
        expect(@cart_reserve).to be_valid
      end
    end
    context '予約注文ができないとき' do
      it 'quantityが空では登録できない' do
        @cart_reserve.quantity = ''
        @cart_reserve.valid?
        expect(@cart_reserve.errors.full_messages).to include("Quantity can't be blank")
      end
      it 'quantityが1未満の値では登録できない' do
        @cart_reserve.quantity = 0
        @cart_reserve.valid?
        expect(@cart_reserve.errors.full_messages).to include("Quantity must be greater than or equal to 1")
      end
      it 'quantityが9を超える値では登録できない' do
        @cart_reserve.quantity = 10
        @cart_reserve.valid?
        expect(@cart_reserve.errors.full_messages).to include("Quantity must be less than or equal to 9")
      end
      it 'messageが空では登録できない' do
        @cart_reserve.message = ''
        @cart_reserve.valid?
        expect(@cart_reserve.errors.full_messages).to include("Message can't be blank")
      end
      it 'honorificが空では登録できない' do
        @cart_reserve.honorific = ''
        @cart_reserve.valid?
        expect(@cart_reserve.errors.full_messages).to include("Honorific can't be blank")
      end
      it 'use_caseが空では登録できない' do
        @cart_reserve.use_case = ''
        @cart_reserve.valid?
        expect(@cart_reserve.errors.full_messages).to include("Use case can't be blank")
      end
      it 'customer_idが紐づいていなければ登録できない' do
        @cart_reserve.customer_id = nil
        @cart_reserve.valid?
        expect(@cart_reserve.errors.full_messages).to include("Customer can't be blank")
      end
      it 'item_idが紐づいていなければ登録できない' do
        @cart_reserve.item_id = nil
        @cart_reserve.valid?
        expect(@cart_reserve.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
