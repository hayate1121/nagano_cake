class Address < ApplicationRecord
  belongs_to :customer
  
  def address_display
    "〒" + self.postal_code + " " + self.address + " " + self.name
  end
end
