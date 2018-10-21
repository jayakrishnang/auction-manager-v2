class CreateBids < ActiveRecord::Migration[5.2]
  def change
    create_table :bids do |t|
      t.references :auction_team, foreign_key: true
      t.references :auction_player, foreign_key: true
      t.integer :bid_amount
      t.boolean :is_closed

      t.timestamps
    end
  end
end
