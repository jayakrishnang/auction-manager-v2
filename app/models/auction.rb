class Auction < ApplicationRecord
  resourcify
  has_many :auction_teams
  has_many :auction_players
  has_many :teams, through: :auction_teams
  has_many :players, class_name: 'User', foreign_key: 'player_id', through: :auction_players
  belongs_to :current_auction_player, class_name: 'AuctionPlayer', foreign_key: 'current_player_id'

  def team_list
    teams.map(&:name).join(', ')
  end

  def team_list=(names)
    self.teams = names.split(',').map do |n|
      Team.where(name: n.strip).first_or_create!
    end
  end

  def player_list
    players.map(&:name).join(', ')
  end

  def player_list=(names)
    self.players = names.split(',').map do |n|
      User.where(name: n.strip).first_or_create!
    end
  end
end
