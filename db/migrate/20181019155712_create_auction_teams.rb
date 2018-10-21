class CreateAuctionTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :auction_teams do |t|
      t.references :auction, foreign_key: true
      t.references :team, foreign_key: true
      t.integer :total_purse
      t.integer :purse_spent

      t.timestamps
    end
  end
end
