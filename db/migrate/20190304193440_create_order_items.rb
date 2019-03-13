class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.belongs_to :product, null: false, index: true
      t.belongs_to :order, null: false, index: true
      t.float :price, null: false
      t.integer :amount, null: false
      t.timestamps
    end
  end
end
