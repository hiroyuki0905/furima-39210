class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_day

  
  
  validates :name,                presence: true, length: { maximum: 40 }
  validates :description,         presence: true, length: { maximum: 1000 }
  validates :category,            presence: true
  validates :condition,           presence: true
  validates :prefecture,          presence: true
  validates :delivery_fee,        presence: true
  validates :delivery_day,        presence: true
  validates :price,               presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :price,               format: { with: /\A[0-9]+\z/, message: "should be a numerical value" }
end
