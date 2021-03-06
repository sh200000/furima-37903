class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name,            presence: true

  validates :last_name,       presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name,      presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }

  validates :last_name_kana,  presence: true, format: { with: /\A[ァ-ヶ]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶ]+\z/ }
  validates :birthday,        presence: true

  has_many   :items
  has_many   :orders
end
