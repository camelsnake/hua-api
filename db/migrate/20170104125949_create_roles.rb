class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.references :role_type, foreign_key: true
      t.references :movie, foreign_key: true
      t.references :participant, foreign_key: true

      t.timestamps
    end
  end
end
