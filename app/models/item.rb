class Item < ApplicationRecord
  has_many :carts, dependent: :delete_all
  has_one_attached :photo
  has_many :join_table_items_orders
  has_many :orders, through: :join_table_items_orders

  validates :title, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :price, presence: true
end
