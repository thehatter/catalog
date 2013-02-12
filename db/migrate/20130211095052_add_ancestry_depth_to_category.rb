class AddAncestryDepthToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :ancestry_depth, :integer
  end
end
