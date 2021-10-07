require 'rails_helper'

RSpec.describe Customer, type: :model do
  before do
    @customer = FactoryBot.build(:customer)
  end

  describe 'カスタマー新規登録' do
    context '新規登録できるとき' do
      it 'email,password,password_confirmation,
    last_name,first_name,last_name_kana,first_name_kana,birthday,phoneが存在すれば登録できる' do
        expect(@customer).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上かつ半角英字1文字以上かつ半角数字1文字以上であれば登録できる' do
        @customer.password = '00000a'
        @customer.password_confirmation = '00000a'
        expect(@customer).to be_valid
      end
      it 'last_nameが空でないかつ全角文字であれば登録できる' do
        @customer.last_name = '手酢'
        expect(@customer).to be_valid
      end
      it 'first_nameが空でないかつ全角文字であれば登録できる' do
        @customer.first_name = '都'
        expect(@customer).to be_valid
      end
      it 'last_name_kanaが空でないかつ全角カナ文字であれば登録できる' do
        @customer.last_name_kana = 'テス'
        expect(@customer).to be_valid
      end
      it 'first_name_kanaが空でないかつ全角カナ文字であれば登録できる' do
        @customer.first_name_kana = 'ト'
        expect(@customer).to be_valid
      end
      it 'birthdayが空でなければ登録できる' do
        @customer.birthday = '20000101'
        expect(@customer).to be_valid
      end
      it 'phoneが空でなければ登録できる' do
        @customer.phone = '01234567890'
        expect(@customer).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'emailが空では登録できない' do
        @customer.email = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@を含まなければ登録できない' do
        @customer.email = 'testtest'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @customer.password = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @customer.password_confirmation = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @customer.password = '0000a'
        @customer.password_confirmation = '0000a'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは英字のみでは登録できない' do
        @customer.password = 'abcdef'
        @customer.password_confirmation = 'abcdef'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordは数字のみでは登録できない' do
        @customer.password = '123456'
        @customer.password_confirmation = '123456'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'お名前(全角)は、名字が空では登録できない' do
        @customer.last_name = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("Last name は全角文字を使用してください")
      end
      it 'お名前(全角)は、名前が空では登録できない' do
        @customer.first_name = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("First name は全角文字を使用してください")
      end
      it 'お名前(全角)は、名字が全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @customer.last_name = 'ABC'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('Last name は全角文字を使用してください')
      end
      it 'お名前(全角)は、名前が全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @customer.first_name = 'ABC'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('First name は全角文字を使用してください')
      end
      it 'お名前カナ(全角)は、名字が空では登録できない' do
        @customer.last_name_kana = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'お名前カナ(全角)は、名前が空では登録できない' do
        @customer.first_name_kana = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'お名前カナ(全角)は、名字がカタカナでなければ登録できない' do
        @customer.last_name_kana = '手酢'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('Last name kana は全角カナ文字を使用してください')
      end
      it 'お名前カナ(全角)は、名前がカタカナでなければ登録できない' do
        @customer.first_name_kana = '都'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('First name kana は全角カナ文字を使用してください')
      end
      it 'birthdayが空では登録できない' do
        @customer.birthday = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("Birthday can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @customer.save
        another_customer = FactoryBot.build(:customer)
        another_customer.email = @customer.email
        another_customer.valid?
        expect(another_customer.errors.full_messages).to include('Email has already been taken')
      end
      it 'phoneが空では登録できない' do
        @customer.phone = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが数字でなければ登録できない' do
        @customer.phone = 'number'
        @customer.valid?
        expect(@customer.errors.full_messages).to include("Phone is not a number")
      end
      it 'phoneが9文字以下では登録できない' do
        @customer.phone = '123456789'
        @customer.valid?
        expect(@customer.errors.full_messages).to include("Phone is too short (minimum is 10 characters)")
      end
      it 'phoneが12文字以上では登録できない' do
        @customer.phone = '123456789012'
        @customer.valid?
        expect(@customer.errors.full_messages).to include("Phone is too long (maximum is 11 characters)")
      end
    end
  end
end