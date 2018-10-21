require "administrate/base_dashboard"

class AuctionTeamDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    auction: Field::BelongsTo,
    team: Field::BelongsTo,
    id: Field::Number,
    total_purse: Field::Number,
    purse_spent: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :auction,
    :team,
    :id,
    :total_purse,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :auction,
    :team,
    :id,
    :total_purse,
    :purse_spent,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :auction,
    :team,
    :total_purse,
    :purse_spent,
  ].freeze

  # Overwrite this method to customize how auction teams are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(auction_team)
  #   "AuctionTeam ##{auction_team.id}"
  # end
end
