class AuctionPlayer < ApplicationRecord
  belongs_to :auction
  belongs_to :player, class_name: 'User', foreign_key: :player_id
  has_many :bids

  # For differentiating form team auctions
  belongs_to :player_auctions, class_name: 'Auction', foreign_key: :auction_id, optional: true

  # Scopes
  scope :unsold, -> { where(bought_by: nil) }
  scope :unskipped, -> { where(is_skipped: false) }
  scope :skipped, -> { where(is_skipped: true) }

  def highest_bid
    self.bids.includes(:team).where.not(bid_amount: nil).order(bid_amount: :desc).limit(1).first
  end

  def close_bid
  	bid = self.highest_bid
    bid.mark_as_closed
    self.update_attributes(bought_by: bid.auction_team_id, bought_for: bid.bid_amount)
    auction_team = bid.auction_team
    auction_team.update_attributes(purse_spent: auction_team.purse_spent + bid.bid_amount)
    bid
  end

  def is_sold?
    self.bought_by.present?
  end

  def skip_player
    self.update_attributes(is_skipped: true)
  end
end
