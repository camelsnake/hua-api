class CreateJoinTableAuthors < ActiveRecord::Migration[5.0]
  def change
    create_join_table :movies, :participants, table_name: :authors do |t|
      t.index [:movie_id, :participant_id]
      t.index [:participant_id, :movie_id]
    end
  end
end
