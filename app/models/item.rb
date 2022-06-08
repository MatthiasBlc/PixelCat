class Item < ApplicationRecord

  has_many :carts, dependent: :delete_all
  has_one_attached :photo, service: :S3
  has_many :order_items
  has_many :orders, through: :order_items

  validates :title, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :price, presence: true
end
