class AuctionTeam < ApplicationRecord
  belongs_to :auction
  belongs_to :team
  has_many :auction_players, foreign_key: :bought_by 
end
