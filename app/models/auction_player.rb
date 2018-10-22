class AuctionPlayer < ApplicationRecord
  belongs_to :auction
  belongs_to :player, class_name: 'User', foreign_key: :player_id
  has_many :bids

  # For differentiating form team auctions
  belongs_to :player_auctions, class_name: 'Auction', foreign_key: :auction_id

  def close_bid
  	highest_bid = self.bids.includes(:team).order(bid_amount: :desc).limit(1).first
    highest_bid.mark_as_closed
    self.update_attributes(bought_by: highest_bid.auction_team_id, bought_for: highest_bid.bid_amount)
  end
end
