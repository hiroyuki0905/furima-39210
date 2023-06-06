class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  has_one :order

  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :delivery_day

  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true 
  validates :condition_id, presence: true

  validates :delivery_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_day_id, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image, presence: true, unless: :was_attached?


  validates :category_id, numericality: { other_than: 0, message: "を入力してください"}
  validates :condition_id, numericality: { other_than: 0, message: "を入力してください"}
  validates :delivery_fee_id, numericality: { other_than: 1, message: "を入力してください"}
  validates :prefecture_id, numericality: { other_than: 0, message: "を入力してください"}
  validates :delivery_day_id, numericality: { other_than: 1, message: "を入力してください"}

  def was_attached?
    image.attached?
  end
  
end
