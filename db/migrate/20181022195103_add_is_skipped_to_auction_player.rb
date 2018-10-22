class AddIsSkippedToAuctionPlayer < ActiveRecord::Migration[5.2]
  def change
    add_column :auction_players, :is_skipped, :boolean, default: false
  end
end
