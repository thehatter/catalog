class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :number
      t.string :number_type

      t.integer :firm_id
      t.index :firm_id

      t.timestamps
    end
  end
end
