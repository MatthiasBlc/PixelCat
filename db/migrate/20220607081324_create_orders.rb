class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :id_user 
      t.integer :id_stripe
      t.datetime :date
      t.decimal :total_price
      

      t.timestamps
    end
  end
end
