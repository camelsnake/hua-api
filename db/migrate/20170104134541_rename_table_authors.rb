class RenameTableAuthors < ActiveRecord::Migration[5.0]
  def change
    rename_table :authors, :authorships
  end
end
