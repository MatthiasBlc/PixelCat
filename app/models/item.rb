class Item < ApplicationRecord
  has_many :carts
  has_many :orders
  has_one_attached :photo

  validates :title, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :price, presence: true
  validates :img_url, presence: true, uniqueness: true
end
