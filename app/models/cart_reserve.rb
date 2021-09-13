class CartReserve
  include ActiveModel::Model
  attr_accessor :customer_id, :quantity, :message,
                :honorific, :use_case, :item_id, :cart_id

  with_options presence: true do
    validates :customer_id
    validates :quantity, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 9 }
    validates :message
    validates :honorific
    validates :use_case
    validates :item_id
    validates :customer_id
  end


  def save
    cart = Cart.where(customer_id: customer_id).first_or_create
    Reserve.create(quantity: quantity, message: message,
       honorific: honorific, use_case: use_case, customer_id: customer_id, item_id: item_id, cart_id: cart.id)
  end
end