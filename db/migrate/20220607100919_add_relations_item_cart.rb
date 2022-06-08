class AddRelationsItemCart < ActiveRecord::Migration[5.2]
  def change
    add_reference :carts, :user, foreign_key: true
    add_reference :carts, :item, foreign_key: true
    add_reference :orders, :user, foreign_key: true
    add_reference :join_table_items_orders, :order, foreign_key: true
    add_reference :join_table_items_orders, :item, foreign_key: true
  end
end
