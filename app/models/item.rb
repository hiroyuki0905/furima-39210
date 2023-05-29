class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_day

  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true, exclusion: { in: [0], message: 'must be other than 0' }
  validates :condition_id, presence: true, exclusion: { in: [0], message: 'must be other than 0' }
  validates :delivery_fee_id, presence: true, exclusion: { in: [0], message: 'must be other than 0' }
  validates :prefecture_id, presence: true, exclusion: { in: [0], message: 'must be other than 0' }
  validates :delivery_day_id, presence: true, exclusion: { in: [0], message: 'must be other than 0' }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

end
