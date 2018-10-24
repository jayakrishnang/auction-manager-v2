App.room = App.cable.subscriptions.create "BidUpdatesChannel",
  received: (data) ->
    if data['type'] == 'new_bid'
      $('#bid-info').html data['content']
    else if data['type'] == 'close_bid'
      $('#bid-info').html data['content']
    else if data['type'] == 'next_player'
      $('#auction_arena').html data['content']

  call_bid: (bid_amount, auction_player_id, auction_team_id)->
    @perform 'call_bid', bid_amount:bid_amount, auction_player_id:auction_player_id, auction_team_id:auction_team_id

  close_bid: (auction_player_id)->
    @perform 'close_bid', auction_player_id:auction_player_id

  next_player: (auction_player_id)->
    @perform 'next_player', auction_player_id:auction_player_id

$(document).ready ->
  $('#bid-btn').on "click", (event)  ->
    bid_amount = $('#bid_amount').val()
    auction_player_id = $('#auction_player_id').val()
    auction_team_id = $('#auction_team_id').val()
    console.log('inside form')
    App.room.call_bid bid_amount, auction_player_id, auction_team_id
    event.target.value = ""
    event.preventDefault()

  $('#close-bid-btn').on "click", (event)  ->
    auction_player_id = $('#auction_player_id').val()
    App.room.close_bid auction_player_id
    event.preventDefault()

  $('#next-player-btn').on "click", (event)  ->
    auction_player_id = $('#auction_player_id').val()
    App.room.next_player auction_player_id
    event.preventDefault()

  $('#bid_amount').on "keypress", (event) ->
    if (event.keyCode == 13)
      $('#bid-btn').click()
