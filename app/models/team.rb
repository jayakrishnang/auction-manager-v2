class Team < ApplicationRecord
  resourcify
  belongs_to :team_owner, class_name: 'User', foreign_key: :team_owner_id
end
