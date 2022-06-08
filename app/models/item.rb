class Item < ApplicationRecord
  has_many :carts
  has_many :join_table_items_orders
  has_many :orders, through: :join_table_items_orders

  validates :title, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :price, presence: true
  validates :img_url, presence: true, uniqueness: true
end
