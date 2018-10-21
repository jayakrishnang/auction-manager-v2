class AuctionTeam < ApplicationRecord
  belongs_to :auction
  belongs_to :team
end
