App.room = App.cable.subscriptions.create "BidUpdatesChannel",
  received: (data) ->
    if data['type'] == 'new_bid'
      $('#bid-info').html data['content']
    else if data['type'] == 'close_bid'
      $('#bid-amount').html data['bid_amount']
      $('#bid-team').html data['bid_team']

  call_bid: (bid_amount, auction_player_id, auction_team_id)->
    @perform 'call_bid', bid_amount:bid_amount, auction_player_id:auction_player_id, auction_team_id:auction_team_id

  close_bid: (player_id)->
    @perform 'call_bid', player_id:player_id
$(document).ready ->
  $('#bid-form').on "submit", (event)  ->
    bid_amount = $(this).find('#bid_amount').val()
    auction_player_id = $(this).find('#auction_player_id').val()
    auction_team_id = $(this).find('#auction_team_id').val()
    console.log('inside form')
    App.room.call_bid bid_amount, auction_player_id, auction_team_id
    event.target.value = ""
    event.preventDefault()
