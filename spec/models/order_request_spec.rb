require 'rails_helper'

RSpec.describe OrderRequest, type: :model do
  before do
    reserve = FactoryBot.create(:reserve)
    @order_request = FactoryBot.build(:order_request, reserve_id: reserve.id)
    sleep 0.3
  end

  describe '商品購入機能' do
    context '商品の購入ができるとき' do
      it 'visit_date,visit_time_id,tokenが存在すれば登録できる' do
        expect(@order_request).to be_valid
      end
      it 'visit_dateが空でなければ登録できる' do
        @order_request.visit_date = '2022/01/01'
        expect(@order_request).to be_valid
      end
      it 'visit_time_idが空でなければ登録できる' do
        @order_request.visit_time_id = 2
        expect(@order_request).to be_valid
      end
      it 'tokenが空でなければ登録できる' do
        @order_request.token = "tok_abcdefghijk00000000000000000"
        expect(@order_request).to be_valid
      end
    end
    context '商品の購入ができないとき' do
      it 'visit_dateが空では登録できない' do
        @order_request.visit_date = ''
        @order_request.valid?
        expect(@order_request.errors.full_messages).to include("Visit date can't be blank")
      end
      it 'visit_time_idが初期値では登録できない' do
        @order_request.visit_time_id = 1
        @order_request.valid?
        expect(@order_request.errors.full_messages).to include("Visit time を入力してください")
      end
      it 'tokenが空では登録できない' do
        @order_request.token = ''
        @order_request.valid?
        expect(@order_request.errors.full_messages).to include("Token can't be blank")
      end
      it 'reserve_idが紐づいていなければ登録できない' do
        @order_request.reserve_id = nil
        @order_request.valid?
        expect(@order_request.errors.full_messages).to include("Reserve can't be blank")
      end
    end
  end
end

