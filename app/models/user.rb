class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :owned_teams, class_name: 'Team', foreign_key: :team_owner_id
  has_many :auctions, through: :owned_teams
  has_many :auction_players, foreign_key: :player_id
  has_many :player_auctions, class_name: 'Auction', through: :auction_players
  has_many :users_roles
  has_many :roles, through: :users_roles

  scope :players, -> { select('users.*').joins(:roles).where(roles: { name: 'player' })}

  def admin?
  	self.has_role? :admin
  end

  def team_owner?
    self.has_role? :team_owner
  end
end
