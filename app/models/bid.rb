class Bid < ApplicationRecord
  belongs_to :auction_team
  belongs_to :auction_player
  has_one :team, through: :auction_team
  # after_create_commit { BidBroadcastJob.perform_later(self) }

  def mark_as_closed
    self.update_attributes(is_closed: true)
  end
end
