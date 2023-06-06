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
        expect(@item.errors[:name]).to include("を入力してください")
      end

      it 'descriptionがない場合は登録できないこと' do
        @item = FactoryBot.build(:item, description: nil)
        @item.valid?
        expect(@item.errors[:description]).to include("を入力してください")
      end

      it 'category_idが0を選ばれていると保存ができない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end

      it 'condition_idが0を選ばれていると保存ができない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end

      it 'delivery_fee_idが0を選ばれていると保存ができない' do
        @item.delivery_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end

      it 'prefecture_idが0を選ばれていると保存ができない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end

      it 'delivery_day_idが0を選ばれていると保存ができない' do
        @item.delivery_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end

      it 'priceがない場合は登録できないこと' do
        @item = FactoryBot.build(:item, price: nil)
        @item.valid?
        expect(@item.errors[:price]).to include("を入力してください", "は数値で入力してください")
      end

      it '半角数字以外が含まれている場合は登録できないこと' do
        @item = FactoryBot.build(:item, price: '５００')
        @item.valid?
        expect(@item.errors[:price]).to include("は数値で入力してください")
      end

      it '300未満の値では保存できないこと' do
        @item = FactoryBot.build(:item, price: 200)
        @item.valid?
        expect(@item.errors[:price]).to include("は300以上の値にしてください")
      end

      it '10000000以上の値では保存できないこと' do
        @item = FactoryBot.build(:item, price: 10_000_000)
        @item.valid?
        expect(@item.errors[:price]).to include("は9999999以下の値にしてください")
      end

      it 'ユーザーが紐づいていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors[:user]).to include("を入力してください")
      end

      it '画像が添付されていないと保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors[:image]).to include("を入力してください")
      end
    end
  end
end
