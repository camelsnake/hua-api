class CreateParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :participants do |t|
      t.string :name
      t.references :participant_type, foreign_key: true

      t.timestamps
    end
  end
end
