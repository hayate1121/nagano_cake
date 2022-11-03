class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: {wait:0, confirm:1, production:2, preparing:3, delivered:4}
end
