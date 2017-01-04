class CreateRoleTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :role_types do |t|
      t.string :name
      t.references :department, foreign_key: true

      t.timestamps
    end
  end
end
