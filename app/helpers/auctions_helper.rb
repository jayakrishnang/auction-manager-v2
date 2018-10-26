module AuctionsHelper
  def up_next_players
    @auction.auction_players.unsold.unskipped.where.not(id: @current_auction_player.id).order(:id) +
      @auction.auction_players.unsold.skipped.order(:id)
  end
end
