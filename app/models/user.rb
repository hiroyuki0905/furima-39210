class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/, message: "は半角英数混合で入力してください" }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龯]+\z/, message: "は全角ひらがな、カタカナ、漢字で入力してください" }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龯]+\z/, message: "は全角ひらがな、カタカナ、漢字で入力してください" }
  validates :last_name_kana, presence: true, format: { with: /\A[\p{Katakana}\p{Blank}ー－]+\z/, message: "は全角カタカナで入力してください" }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{Katakana}\p{Blank}ー－]+\z/, message: "は全角カタカナで入力してください" }
  validates :birthday, presence: true
end