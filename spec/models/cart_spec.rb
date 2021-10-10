require 'rails_helper'

RSpec.describe Cart, type: :model do
  before do
    @cart = FactoryBot.build(:cart)
  end
  describe 'カート機能' do
    it 'customerが紐づいていなければ登録できない' do
      @cart.customer = nil
      @cart.valid?
      expect(@cart.errors.full_messages).to include('Customer must exist')
    end
  end
end