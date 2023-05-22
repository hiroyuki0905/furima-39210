require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(nickname: "abe", email: "", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'メールアドレスがすでに登録しているユーザーと重複していると保存できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      # binding.pry
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'パスワードが空欄だと保存できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", 'Password Include both letters and numbers', "Password confirmation doesn't match Password")
    end
    it 'パスワード（確認含む）が5文字以下だと保存できない' do
      @user.password = 'ab123'
      @user.password_confirmation = 'ab123'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワード（確認含む）が半角英数字でないと保存できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end
    it 'パスワード（確認）が空欄だと保存できない' do
      @user.password = '123abc'
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '名字が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.last_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end
    it '名前が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.first_name = 'rikutaro'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it '名字のフリガナが全角（カタカナ）でないと登録できない' do
      @user.last_name_kana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end
    it '名前のフリガナが全角（カタカナ）でないと登録できない' do
      @user.first_name_kana = 'りくたろう'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    it '生年月日が空欄だと保存できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
