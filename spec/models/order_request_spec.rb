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
  end
end

