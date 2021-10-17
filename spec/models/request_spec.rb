require 'rails_helper'

RSpec.describe Request, type: :model do
  before do
    @request = FactoryBot.build(:request)
  end
=begin
  pending "add some examples to (or delete) #{__FILE__}"

  describe '来店日時の登録' do
    context '来店日時の登録ができるとき' do
      it 'visit_date,visit_time_idが存在すれば登録できる' do
        expect(@request).to be_valid
      end
      it 'visit_dateが空でなければ登録できる' do
        @request.visit_date = '2022/01/01'
        expect(@request).to be_valid
      end
      it 'visit_time_idが空でなければ登録できる' do
        @request.visit_time_id = 2
        expect(@request).to be_valid
      end
    end
    context '来店日時の登録ができないとき' do
      it 'visit_dateが空では登録できない' do
        @request.visit_date = ""
        @request.valid?
        expect(@request.errors.full_messages).to include("Visit date can't be blank")
      end
      it 'visit_time_idが初期値では登録できない' do
        @request.visit_time_id = 1
        @request.valid?
        expect(@request.errors.full_messages).to include("Visit time id must be other than 1")
      end
      it 'orderが紐づいていなければ登録できない' do
        @request.order = nil
        @request.valid?
        expect(@request.errors.full_messages).to include('Order must exist')
      end
    end
  end
#orderモデル単体テスト記述後にコメントアウト外す
=end
end