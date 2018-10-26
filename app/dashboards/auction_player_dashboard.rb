require "administrate/base_dashboard"

class AuctionPlayerDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    auction: Field::BelongsTo,
    player: Field::BelongsTo.with_options(class_name: "User"),
    id: Field::Number,
    player_id: Field::Number,
    minimum_bid_amount: Field::Number,
    bought_by: Field::Number,
    bought_for: Field::Number,
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
    :player,
    :id,
    :player_id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :auction,
    :player,
    :id,
    # :player_id,
    :minimum_bid_amount,
    :bought_by,
    :bought_for,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :auction,
    :player,
    # :player_id,
    :minimum_bid_amount,
    :bought_by,
    :bought_for,
  ].freeze

  # Overwrite this method to customize how auction players are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(auction_player)
    "#{auction_player.auction.title} - #{auction_player.player.name}"
  end
end
