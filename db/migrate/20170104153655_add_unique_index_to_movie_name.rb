class AddUniqueIndexToMovieName < ActiveRecord::Migration[5.0]
  def change
    add_index :movies, :name, unique: true
  end
end
