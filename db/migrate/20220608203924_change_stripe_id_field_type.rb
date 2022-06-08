class ChangeStripeIdFieldType < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :id_stripe, :string
  end
end
