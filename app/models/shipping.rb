class Shipping < ApplicationRecord
  validates :post_code, presence: true
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :city, presence: true
  validates :address, presence: true
  validates :building
  validates :telephone, presence: true

  belongs_to :order
end
