class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :number
      t.string :number_type

      t.integer :address_id

      t.timestamps
    end
      add_index :phones, :address_id
  end
end