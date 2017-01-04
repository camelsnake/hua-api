class AddIdToAuthors < ActiveRecord::Migration[5.0]
  def change
    add_column :authors, :id, :primary_key
  end
end
