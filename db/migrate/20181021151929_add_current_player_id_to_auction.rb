class AddCurrentPlayerIdToAuction < ActiveRecord::Migration[5.2]
  def change
    add_column :auctions, :current_player_id, :integer
  end
end
