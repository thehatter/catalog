class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|

      t.integer :firm_id
      t.string :line_1

      t.timestamps
    end

      add_index :addresses, :firm_id
  end
end
