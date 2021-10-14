require 'rails_helper'

RSpec.describe Reserve, type: :model do
  before do
    @reserve = FactoryBot.build(:reserve)
  end

  describe '予約注文機能' do
    context '予約注文ができるとき' do
      it 'quantity,message,honorific,use_caseが存在すれば登録できる' do
        expect(@reserve).to be_valid
      end
      it 'quantityが空でないかつ1~9の間であれば登録できる' do
        @reserve.quantity = 1
        expect(@reserve).to be_valid
      end
      it 'messageが空でなければ登録できる' do
        @reserve.message = 'aaaaaa'
        expect(@reserve).to be_valid
      end
      it 'honorificが空でなければ登録できる' do
        @reserve.honorific = 'aaaaaa'
        expect(@reserve).to be_valid
      end
      it 'use_caseが空でなければ登録できる' do
        @reserve.use_case = 'aaaaaa'
        expect(@reserve).to be_valid
      end
    end
    context '予約注文ができないとき' do
      it 'quantityが空では登録できない' do
        @reserve.quantity = ''
        @reserve.valid?
        expect(@reserve.errors.full_messages).to include("Quantity can't be blank")
      end
      it 'quantityが1未満の値では登録できない' do
        @reserve.quantity = 0
        @reserve.valid?
        expect(@reserve.errors.full_messages).to include("Quantity must be greater than or equal to 1")
      end
      it 'quantityが9を超える値では登録できない' do
        @reserve.quantity = 10
        @reserve.valid?
        expect(@reserve.errors.full_messages).to include("Quantity must be less than or equal to 10")
      end
      it 'messageが空では登録できない' do
        @reserve.message = ''
        @reserve.valid?
        expect(@reserve.errors.full_messages).to include("Message can't be blank")
      end
      it 'honorificが空では登録できない' do
        @reserve.honorific = ''
        @reserve.valid?
        expect(@reserve.errors.full_messages).to include("Honorific can't be blank")
      end
      it 'use_caseが空では登録できない' do
        @reserve.use_case = ''
        @reserve.valid?
        expect(@reserve.errors.full_messages).to include("Use case can't be blank")
      end
      it 'customerが紐づいていなければ登録できない' do
        @reserve.customer = nil
        @reserve.valid?
        expect(@reserve.errors.full_messages).to include('Customer must exist')
      end
      it 'itemが紐づいていなければ登録できない' do
        @reserve.item = nil
        @reserve.valid?
        expect(@reserve.errors.full_messages).to include('Item must exist')
      end
      it 'cartが紐づいていなければ登録できない' do
        @reserve.cart = nil
        @reserve.valid?
        expect(@reserve.errors.full_messages).to include('Cart must exist')
      end
    end
  end
end
=begin
FormObjectPatternに要変更
=end