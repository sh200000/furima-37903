class OrderShipping
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :city, :address, :building, :telephone, :token

  validates :token, presence: true
  validates :post_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :city, presence: true
  validates :address, presence: true
  validates :telephone, presence: true, format: { with: /\A\d{10,11}\z/ }
 
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    
    Shipping.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, telephone: telephone, order_id: order.id)
  end
end