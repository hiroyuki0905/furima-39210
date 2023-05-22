require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
      # nicknameが空では登録できないテストコードを記述します
    end
    it 'emailが空では登録できない' do
      user = User.new(nickname: "abe", email: "", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
      # emailが空では登録できないテストコードを記述します
    end
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
