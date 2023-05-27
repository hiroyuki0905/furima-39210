require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

    it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
      expect(@item).to be_valid
    end  

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

    it 'conditionがない場合は登録できないこと' do
      @item = FactoryBot.build(:item, condition_id: nil)
      @item.valid?
      expect(@item.errors[:condition_id]).to include("can't be blank")
    end

    it 'delivery_feeがない場合は登録できないこと' do
      @item = FactoryBot.build(:item, delivery_fee_id: nil)
      @item.valid?
      expect(@item.errors[:delivery_fee_id]).to include("can't be blank")
    end

    it 'prefecture_idがない場合は登録できないこと' do
      @item = FactoryBot.build(:item, prefecture_id: nil)
      @item.valid?
      expect(@item.errors[:prefecture_id]).to include("can't be blank")
    end

    it 'delivery_dayがない場合は登録できないこと' do
      @item = FactoryBot.build(:item, delivery_day_id: nil)
      @item.valid?
      expect(@item.errors[:delivery_day_id]).to include("can't be blank")
    end

    it 'priceがない場合は登録できないこと' do
      @item = FactoryBot.build(:item, price: nil)
      @item.valid?
      expect(@item.errors[:price]).to include("can't be blank")
    end
end
