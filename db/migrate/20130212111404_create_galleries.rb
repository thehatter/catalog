class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :image
      t.string :title
      t.string :alt

      t.integer :weight
      t.integer :firm_id

      t.timestamps
    end

    add_index :galleries, :firm_id

  end
end
