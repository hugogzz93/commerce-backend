class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :stock, null: false, default: 0
      t.float :price, null: false, default: 0
      t.belongs_to :user, null: false
      t.belongs_to :category, null: false
      t.string :image
      t.timestamps
    end
  end
end
