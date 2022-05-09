class Item < ApplicationRecord
  validates :name,            presence: true
  validates :content,            presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :shipping_charge_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :shipping_day_id, numericality: { other_than: 1 }
  validates :price,            presence: true, numericality: { only_integer: true ,greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :image, presence: true, blob: { content_type: :image }

  belongs_to :user
  #has_one    :order
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_day

end
