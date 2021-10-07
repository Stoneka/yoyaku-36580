require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品の出品ができるとき' do
      it 'images,item_name,explanation,size_id,price,
      calorie,protein,fat,salt,carbが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'imageが空でなければ登録できる' do
        @item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
        expect(@item).to be_valid
      end
      it 'item_nameが空でなければ登録できる' do
        @item.item_name = 'aaaaaa'
        expect(@item).to be_valid
      end
      it 'expalanationが空でなければ登録できる' do
        @item.explanation = 'aaaaaa'
        expect(@item).to be_valid
      end
      it 'size_idが空でなければ登録できる' do
        @item.size_id = 2
        expect(@item).to be_valid
      end
      it 'priceが空でないかつ1~99,999の間であれば登録できる' do
        @item.price = 3000
        expect(@item).to be_valid
      end
      it 'calorieが空でないかつ0~9,999の間であれば登録できる' do
        @item.calorie = 2500
        expect(@item).to be_valid
      end
      it 'proteinが空でないかつ0~9,999の間であれば登録できる' do
        @item.protein = 2000
        expect(@item).to be_valid
      end
      it 'fatが空でないかつ0~9,999の間であれば登録できる' do
        @item.fat = 1500
        expect(@item).to be_valid
      end
      it 'saltが空でないかつ0~9,999の間であれば登録できる' do
        @item.salt = 1000
        expect(@item).to be_valid
      end
      it 'carbが空でないかつ0~9,999の間であれば登録できる' do
        @item.carb = 500
        expect(@item).to be_valid
      end
    end
=begin
    context '商品の出品ができないとき' do
      it 'imagesが空では登録できない' do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品画像を入力してください")
      end
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'category_idが初期値では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it 'status_idが初期値では登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it 'burden_method_idが初期値では登録できない' do
        @item.burden_method_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it 'shipment_source_idが初期値では登録できない' do
        @item.shipment_source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it 'shipping_days_idが初期値では登録できない' do
        @item.shipping_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end
      it 'priceが300未満の値では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は300以上の値にしてください')
      end
      it 'priceが9,999,999を超える値では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は9999999以下の値にしてください')
      end
      it 'priceが全角数字では登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end
      it 'priceが半角英数字混合では登録できない' do
        @item.price = 'ab12'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end
      it 'priceが半角英字では登録できない' do
        @item.price = 'abcd'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end
      it 'userが紐づいていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('ユーザーを入力してください')
      end
    end
=end
  end
end