class AddCounterCacheToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :firms_count, :integer, default: 0


    Category.find_each do |category|
        Category.reset_counters category.id, :firms
    end

  end
end
