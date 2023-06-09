class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :token

  def item=(item)
    self.item_id = item.id
  end

  with_options presence: true do
    validates :user_id
    validates :item_id

    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は無効です。ハイフン(-)を含めてください" }
    validates :prefecture_id, numericality: { other_than: 0, message: "を選択してください" }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'が無効です' }
    validates :token, presence: { message: "を入力してください" }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone_number: phone_number)
  end
end