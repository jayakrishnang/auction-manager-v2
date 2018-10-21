require "administrate/base_dashboard"

class PlayerTeamDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    team: Field::BelongsTo,
    player: Field::BelongsTo.with_options(class_name: "User"),
    id: Field::Number,
    player_id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :team,
    :player,
    :id,
    :player_id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :team,
    :player,
    :id,
    :player_id,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :team,
    :player,
    :player_id,
  ].freeze

  # Overwrite this method to customize how player teams are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(player_team)
  #   "PlayerTeam ##{player_team.id}"
  # end
end
