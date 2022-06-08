class Order < ApplicationRecord
    belongs_to :user
    has_many :join_table_items_orders
    has_many :items, through: :join_table_items_orders
end
