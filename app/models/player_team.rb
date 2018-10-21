class PlayerTeam < ApplicationRecord
  belongs_to :team
  belongs_to :player, class_name: 'User', foreign_key: :player_id
end
