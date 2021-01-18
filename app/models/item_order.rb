class ItemOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :area, :address, :building, :phone, :item_id, :user_id, :order_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area
    validates :address
    validates :phone, format: { with: /\A[0-9]{1,11}\z/, message: 'gotta be within 11 numbers' }
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, area: area, address: address,
                           building: building, phone: phone, order_id: order.id)
  end
end
