class OrderShipping
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :city, :address, :building, :telephone, :token
  
  with_options presence: true do
    validates :token
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :city
    validates :address
    validates :telephone, format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
  end

  validates :prefecture_id, numericality: { other_than: 1 , message: "を選択してください"}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    Shipping.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building,
                    telephone: telephone, order_id: order.id)
  end
end
