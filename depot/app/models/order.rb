require 'active_model/serializers/xml'

class Order < ApplicationRecord
	include ActiveModel::Serializers::Xml
	
 has_many :line_items, dependent: :destroy
  # ...
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end


  validates :name, :address, :email, presence: true
  #validates :pay_type, inclusion: pay_types.keys

	enum pay_type: {
	    "Check"          => 0, 
	    "Credit card"    => 1, 
	    "Purchase order" => 2
	}
end
