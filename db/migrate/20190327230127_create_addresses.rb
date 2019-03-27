class CreateAddresses < ActiveRecord::Migration[5.2]
  def change

    create_table :addresses do |t|
      t.string :country, null: false
      t.string :full_name, null: false
      t.string :street1, null: false
      t.string :street2, null: true
      t.string :city, null: false
      t.string :zip, null: false
      t.string :phone, null: false
      t.string :security_code, null: true
      t.text :instructions, null: true

      t.belongs_to :user, index: true

      t.timestamps
    end

    change_table :orders do |t|
      t.belongs_to :address, index: true
    end

  end
end
