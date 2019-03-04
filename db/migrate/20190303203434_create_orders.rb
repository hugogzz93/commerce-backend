class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :status, null: false, default: 0, indexed: true
      t.string :group_id, indexed: true
      t.belongs_to :vendor, foreign_key: {to_table: :users}, index: true
      t.belongs_to :client, foreign_key: {to_table: :users}, index: true
      t.timestamps
    end
  end
end
