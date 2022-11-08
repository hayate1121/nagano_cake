class Order < ApplicationRecord

  enum status: {wait:0, confirm:1, production:2, preparing:3, delivered:4}
  enum payment_method: {credit_card:0, transfer:1}
end