class AddCategoryIdToFirms < ActiveRecord::Migration
  def change
    add_column :firms, :category_id, :integer
    
    add_index :firms, :category_id
  end
end
