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
    
    context '商品の出品ができないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'size_idが初期値では登録できない' do
        @item.size_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Size must be other than 1")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが1未満の値では登録できない' do
        @item.price = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 1")
      end
      it 'priceが99,999を超える値では登録できない' do
        @item.price = 100_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 99999")
      end
      it 'priceが全角数字では登録できない' do
        @item.price = '１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが半角英数字混合では登録できない' do
        @item.price = 'ab12'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが半角英字では登録できない' do
        @item.price = 'abcd'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'calorieが0未満の値では登録できない' do
        @item.calorie = -1
        @item.valid?
        expect(@item.errors.full_messages).to include("Calorie must be greater than or equal to 0")
      end
      it 'calorieが9,999を超える値では登録できない' do
        @item.calorie = 10_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Calorie must be less than or equal to 9999")
      end
      it 'calorieが全角数字では登録できない' do
        @item.calorie = '１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Calorie is not a number")
      end
      it 'calorieが半角英数字混合では登録できない' do
        @item.calorie = 'ab12'
        @item.valid?
        expect(@item.errors.full_messages).to include("Calorie is not a number")
      end
      it 'calorieが半角英字では登録できない' do
        @item.calorie = 'abcd'
        @item.valid?
        expect(@item.errors.full_messages).to include("Calorie is not a number")
      end
      it 'proteinが0未満の値では登録できない' do
        @item.protein = -1
        @item.valid?
        expect(@item.errors.full_messages).to include("Protein must be greater than or equal to 0")
      end
      it 'proteinが9,999を超える値では登録できない' do
        @item.protein = 10_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Protein must be less than or equal to 9999")
      end
      it 'proteinが全角数字では登録できない' do
        @item.protein = '１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Protein is not a number")
      end
      it 'proteinが半角英数字混合では登録できない' do
        @item.protein = 'ab12'
        @item.valid?
        expect(@item.errors.full_messages).to include("Protein is not a number")
      end
      it 'proteinが半角英字では登録できない' do
        @item.protein = 'abcd'
        @item.valid?
        expect(@item.errors.full_messages).to include("Protein is not a number")
      end
      it 'fatが0未満の値では登録できない' do
        @item.fat = -1
        @item.valid?
        expect(@item.errors.full_messages).to include("Fat must be greater than or equal to 0")
      end
      it 'fatが9,999を超える値では登録できない' do
        @item.fat = 10_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Fat must be less than or equal to 9999")
      end
      it 'fatが全角数字では登録できない' do
        @item.fat = '１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Fat is not a number")
      end
      it 'fatが半角英数字混合では登録できない' do
        @item.fat = 'ab12'
        @item.valid?
        expect(@item.errors.full_messages).to include("Fat is not a number")
      end
      it 'fatが半角英字では登録できない' do
        @item.fat = 'abcd'
        @item.valid?
        expect(@item.errors.full_messages).to include("Fat is not a number")
      end
      it 'saltが0未満の値では登録できない' do
        @item.salt = -1
        @item.valid?
        expect(@item.errors.full_messages).to include("Salt must be greater than or equal to 0")
      end
      it 'saltが9,999を超える値では登録できない' do
        @item.salt = 10_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Salt must be less than or equal to 9999")
      end
      it 'saltが全角数字では登録できない' do
        @item.salt = '１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Salt is not a number")
      end
      it 'saltが半角英数字混合では登録できない' do
        @item.salt = 'ab12'
        @item.valid?
        expect(@item.errors.full_messages).to include("Salt is not a number")
      end
      it 'saltが半角英字では登録できない' do
        @item.salt = 'abcd'
        @item.valid?
        expect(@item.errors.full_messages).to include("Salt is not a number")
      end
      it 'carbが0未満の値では登録できない' do
        @item.carb = -1
        @item.valid?
        expect(@item.errors.full_messages).to include("Carb must be greater than or equal to 0")
      end
      it 'carbが9,999を超える値では登録できない' do
        @item.carb = 10_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Carb must be less than or equal to 9999")
      end
      it 'carbが全角数字では登録できない' do
        @item.carb = '１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Carb is not a number")
      end
      it 'carbが半角英数字混合では登録できない' do
        @item.carb = 'ab12'
        @item.valid?
        expect(@item.errors.full_messages).to include("Carb is not a number")
      end
      it 'carbが半角英字では登録できない' do
        @item.carb = 'abcd'
        @item.valid?
        expect(@item.errors.full_messages).to include("Carb is not a number")
      end
    end
  end
end