require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'ユーザー出品機能' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nameがない場合は登録できないこと' do
        @item = FactoryBot.build(:item, name: nil)
        @item.valid?
        expect(@item.errors[:name]).to include("can't be blank")
      end

      it 'descriptionがない場合は登録できないこと' do
        @item = FactoryBot.build(:item, description: nil)
        @item.valid?
        expect(@item.errors[:description]).to include("can't be blank")
      end

      it 'category_idが0を選ばれていると保存ができない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end

      it 'condition_idが0を選ばれていると保存ができない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 0')
      end

      it 'delivery_fee_idが0を選ばれていると保存ができない' do
        @item.delivery_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee must be other than 0')
      end

      it 'prefecture_idが0を選ばれていると保存ができない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
      end

      it 'delivery_day_idが0を選ばれていると保存ができない' do
        @item.delivery_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery day must be other than 0')
      end

      it 'priceがない場合は登録できないこと' do
        @item = FactoryBot.build(:item, price: nil)
        @item.valid?
        expect(@item.errors[:price]).to include("can't be blank")
      end

      it '半角数字以外が含まれている場合は登録できないこと' do
        @item = FactoryBot.build(:item, price: '５００')
        @item.valid?
        expect(@item.errors[:price]).to include('is not a number')
      end

      it '300未満の値では保存できないこと' do
        @item = FactoryBot.build(:item, price: 200)
        @item.valid?
        expect(@item.errors[:price]).to include('must be greater than or equal to 300')
      end

      it '10000000以上の値では保存できないこと' do
        @item = FactoryBot.build(:item, price: 10_000_000)
        @item.valid?
        expect(@item.errors[:price]).to include('must be less than or equal to 9999999')
      end

      it 'ユーザーが紐づいていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors[:user]).to include('must exist')
      end

      it '画像が添付されていないと保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors[:image]).to include("can't be blank")
      end
    end
  end
end
