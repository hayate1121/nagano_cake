class Customer < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  def full_name
    self.last_name + self.first_name
  end
  
  def address_display
    "〒" + self.postal_code + " " + self.address + " " + self.full_name
  end
  
end
