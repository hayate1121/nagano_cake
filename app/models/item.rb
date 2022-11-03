class Item < ApplicationRecord
  has_one_attached :item_image
  belongs_to :genre
end
