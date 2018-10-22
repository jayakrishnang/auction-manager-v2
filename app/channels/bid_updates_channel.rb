class BidUpdatesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "bid_updates_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def call_bid(data)
    auction_team = AuctionTeam.where(id: data['auction_team_id']).first.team
    content = ApplicationController.renderer.render(partial: 'shared/bid_info', locals: { bid_amount: data['bid_amount'], team_name: auction_team.name })
    bid = Bid.create(bid_amount: data['bid_amount'], auction_player_id: data['auction_player_id'], auction_team_id: data['auction_team_id'])
    ActionCable.server.broadcast 'bid_updates_channel', type: 'new_bid', content: content
  end

  def close_bid(data)
    auction_player = AuctionPlayer.where(id: data['auction_player_id']).first
    team_name, bid_amount = auction_player.close_bid
    content = ApplicationController.renderer.render(partial: 'shared/closed_bid', locals: { bid_amount: bid_amount, team_name: team_name })
    ActionCable.server.broadcast 'bid_updates_channel', type: 'close_bid', content: content
  end

  def next_player(data)
    auction_player = AuctionPlayer.where(id: data['auction_player_id']).first
    auction_player.skip_player unless auction_player.is_sold?
    auction = auction_player.auction
    next_auction_player = auction.find_next_auction_player
    auction.update_attributes(current_player_id: next_auction_player.id)
    content = ApplicationController.renderer.render(partial: 'auctions/auction_arena', locals: { current_player: next_auction_player.player,
                                                                                                 current_auction_player: next_auction_player,
                                                                                                 highest_bid: next_auction_player.highest_bid,
                                                                                                 user: current_user })
    ActionCable.server.broadcast 'bid_updates_channel', type: 'next_player', content: content
  end
end
