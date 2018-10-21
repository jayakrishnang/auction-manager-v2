class CreatePlayerTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :player_teams do |t|
      t.integer :player_id
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
