class AddFavatarToFirms < ActiveRecord::Migration
  def change
    add_column :firms, :favatar, :string
  end
end
