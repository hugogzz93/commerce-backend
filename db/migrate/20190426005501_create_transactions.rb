class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.belongs_to :order, null: false
      t.integer :status, null: false, default: 0, indexed: true
      t.decimal :value, null: false, precision: 8, scale: 2
      t.timestamps
    end
  end
end
