class CreateAuctionPlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :auction_players do |t|
      t.references :auction, foreign_key: true
      t.integer :player_id
      t.integer :minimum_bid_amount
      t.integer :bought_by
      t.integer :bought_for

      t.timestamps
    end
  end
end
