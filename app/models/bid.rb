class Bid < ApplicationRecord
  # belongs_to :auction_team
  # belongs_to :auction_player
  after_create_commit { BidBroadcastJob.perform_later(self) }
end
