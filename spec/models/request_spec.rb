require 'rails_helper'

RSpec.describe Request, type: :model do
  before do
    @request = FactoryBot.build(:request)
  end
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
=begin
    context '来店日時の登録ができないとき' do
      it 'orderが紐づいていなければ登録できない' do
        @request.customer = nil
        @request.valid?
        expect(@request.errors.full_messages).to include('Customer must exist')
      end
    end
=end
  end
end