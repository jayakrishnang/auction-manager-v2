class Team < ApplicationRecord
  resourcify
  belongs_to :team_owner, class_name: 'User', foreign_key: :team_owner_id
  has_many :auction_teams
  has_many :auctions, through: :auction_teams
end
