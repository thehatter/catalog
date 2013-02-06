class CreateFirms < ActiveRecord::Migration
  def change
    create_table :firms do |t|
      t.string :name
      t.text :short_description
      t.text :description
      t.integer :user_id


      t.timestamps
    end
  end
end
