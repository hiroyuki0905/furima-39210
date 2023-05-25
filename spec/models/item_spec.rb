require 'rails_helper'

describe Item do
  describe '#create' do

    it "必須項目が入力されていれば登録できること" do
      category = create(:category)
      user = create(:user)
      item = build(:item,category: category, seller_id: user.id )
      expect(item).to be_valid
    end

    it "nameがない場合は登録できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "descriptionがない場合は登録できないこと" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("を入力してください")
    end

    it "conditionがない場合は登録できないこと" do
      item = build(:item, condition: nil)
      item.valid?
      expect(item.errors[:condition]).to include("を入力してください")
    end

    it "delivery_feeがない場合は登録できないこと" do
      item = build(:item, delivery_fee: nil)
      item.valid?
      expect(item.errors[:delivery_fee]).to include("を入力してください")
    end

    it "prefecture_idがない場合は登録できないこと" do
      item = build(:item, prefecture_id: nil)
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

    it "delivery_daysがない場合は登録できないこと" do
      item = build(:item, delivery_days: nil)
      item.valid?
      expect(item.errors[:delivery_days]).to include("を入力してください")
    end

    it "priceがない場合は登録できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

  end
end