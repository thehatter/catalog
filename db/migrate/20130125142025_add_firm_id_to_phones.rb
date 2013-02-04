class AddFirmIdToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :firm_id, :string

    add_index :phones, :firm_id
  end
end
