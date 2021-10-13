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
  end
end
