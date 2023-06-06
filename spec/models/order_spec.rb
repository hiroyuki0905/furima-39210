require 'rails_helper'
RSpec.describe OrderForm, type: :model do
  describe '配送先情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_form = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_form).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @order_form.building = ''
        expect(@order_form).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it '郵便番号が空だと保存できないこと' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("郵便番号を入力してください", "郵便番号は無効です。ハイフン(-)を含めてください")
      end

      it '郵便番号にハイフンがないと保存できないこと' do
        @order_form.postal_code = 1234567
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("郵便番号は無効です。ハイフン(-)を含めてください")
      end

      it '都道府県が「---」だと保存できないこと' do
        @order_form.prefecture_id = 0
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("都道府県を選択してください")
      end

      it '市区町村が空だと保存できないこと' do
        @order_form.city =  ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("市区町村を入力してください")
      end

      it '番地が空だと保存できないこと' do
        @order_form.house_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("番地を入力してください")
      end

      it '電話番号が空だと保存できないこと' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("電話番号を入力してください", "電話番号が無効です")
      end

      it '電話番号にハイフンがあると保存できないこと' do
        @order_form.phone_number = '123 - 1234 - 1234'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("電話番号が無効です")
      end

      it '電話番号が12桁以下では購入できない' do
        @order_form.phone_number = 1234567891011
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("電話番号が無効です")
      end
      
      it '電話番号が9桁以下では保存できないこと' do
        @order_form.phone_number = '123456'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("電話番号が無効です")
      end

      it "tokenが空では登録できないこと" do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("トークンを入力してください")
      end
    end
  end
end