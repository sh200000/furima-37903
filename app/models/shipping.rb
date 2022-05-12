class Shipping < ApplicationRecord
  validates :post_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :city, presence: true
  validates :address, presence: true
  validates :building
  validates :telephone, presence: true, format: { with: /\A\d{10,11}\z/ }

  belongs_to :order
end
