class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer
  enum payment_method: {credit_card: 0, transfer: 1}
  enum status: {wait:0, confirm:1, production:2, preparing:3, delivered:4}
  
  def address_display
    "〒" + self.postal_code + " " + self.address + " " + self.name
  end
end
