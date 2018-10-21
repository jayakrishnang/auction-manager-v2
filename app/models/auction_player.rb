class AuctionPlayer < ApplicationRecord
  belongs_to :auction
  belongs_to :player, class_name: 'User', foreign_key: :player_id
end
