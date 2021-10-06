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

=begin
    context '新規登録できないとき' do
      it 'emailが空では登録できない' do
        @customer.email = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'emailに@を含まなければ登録できない' do
        @customer.email = 'testtest'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空では登録できない' do
        @customer.password = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @customer.password_confirmation = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("パスワード（確認）とパスワードの入力が一致しません")
      end
      it 'passwordが5文字以下では登録できない' do
        @customer.password = '0000a'
        @customer.password_confirmation = '0000a'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordは英字のみでは登録できない' do
        @customer.password = 'abcdef'
        @customer.password_confirmation = 'abcdef'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end
      it 'passwordは数字のみでは登録できない' do
        @customer.password = '123456'
        @customer.password_confirmation = '123456'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end
      it 'お名前(全角)は、名字が空では登録できない' do
        @customer.last_name = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("名字を入力してください")
      end
      it 'お名前(全角)は、名前が空では登録できない' do
        @customer.first_name = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("名前を入力してください")
      end
      it 'お名前(全角)は、名字が全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @customer.last_name = 'ABC'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('名字は全角文字を使用してください')
      end
      it 'お名前(全角)は、名前が全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @customer.first_name = 'ABC'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('名前は全角文字を使用してください')
      end
      it 'お名前カナ(全角)は、名字が空では登録できない' do
        @customer.last_name_kana = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("名字（カナ）を入力してください")
      end
      it 'お名前カナ(全角)は、名前が空では登録できない' do
        @customer.first_name_kana = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("名前（カナ）を入力してください")
      end
      it 'お名前カナ(全角)は、名字がカタカナでなければ登録できない' do
        @customer.last_name_kana = '手酢'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('名字（カナ）は全角カナ文字を使用してください')
      end
      it 'お名前カナ(全角)は、名前がカタカナでなければ登録できない' do
        @customer.first_name_kana = '都'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('名前（カナ）は全角カナ文字を使用してください')
      end
      it 'birthdayが空では登録できない' do
        @customer.birthday = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("生年月日を入力してください")
      end
      it '重複したemailが存在する場合登録できない' do
        @customer.save
        another_user = FactoryBot.build(:user)
        another_user.email = @customer.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'phoneが空では登録できない' do
        @customer.phone = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("ニックネームを入力してください")
      end
    end
=end
  end
end