class BidUpdatesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "bid_updates_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def call_bid(data)
    auction_team = AuctionTeam.where(id: data['auction_team_id']).first.team
    if current_user.admin?
    #   player.sell_player
    #   @bid_log = BidLog.get_highest_bid(player.id)
    #   @bid_log.is_closed = true
    elsif current_user.team_owner?
      bid = Bid.create(bid_amount: data['bid_amount'], auction_player_id: data['auction_player_id'], auction_team_id: data['auction_team_id'])
      # player.update_team_status
    end
    ActionCable.server.broadcast 'bid_updates_channel', type: 'new_bid', bid_amount: data['bid_amount'], bid_team: auction_team.name
  end

  def close_bid
  	auction_player = AuctionPlayer.find(data['auction_player_id'])
  	auction_player.close_bid
  	ActionCable.server.broadcast 'bid_updates_channel', type: 'close_bid', bid_amount: data['bid_amount'], bid_team: auction_team.name
  end
end
