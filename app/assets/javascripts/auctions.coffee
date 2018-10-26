App.room = App.cable.subscriptions.create "BidUpdatesChannel",
  received: (data) ->
    if data['type'] == 'new_bid'
      $('#bid-info').html data['content']
    else if data['type'] == 'close_bid'
      $('#bid-info').html data['content']
      if data['auction_team_id'] == $('#auction_team_id').val()
        $('#stats-' + data['auction_team_id']).html data['stats_content']
        $('#my_team_thumbs-' + data['auction_team_id']).append data['thumbs_content']
      else if $('#arena_type').val() == 'admin'
        $('#stats-' + data['auction_team_id']).html data['stats_content']
        $('#my_team_thumbs-' + data['auction_team_id']).append data['thumbs_content']
    else if data['type'] == 'next_player'
      $('#auction_arena').html data['content']
      $('#all_players_thumb').children().first().remove()
      if data['skipped_player_content'] != null
        $('#all_players_thumb').append data['skipped_player_content']

  call_bid: (bid_amount, auction_player_id, auction_team_id)->
    @perform 'call_bid', bid_amount:bid_amount, auction_player_id:auction_player_id, auction_team_id:auction_team_id

  close_bid: (auction_player_id)->
    @perform 'close_bid', auction_player_id:auction_player_id

  next_player: (auction_player_id)->
    @perform 'next_player', auction_player_id:auction_player_id

validateBidding = ->
  debugger
  balance = $('#purse_balance').val()
  bid_amount = $('#bid_amount').val()
  base_points = $('#base_points').val()
  noOfPlayers = $('#no_of_players').val()
  totalNoOfPlayers = $('#total_no_of_players_needed').val()
  currentBid = $('#current_bid_amount')
  bid_closed = $('#bid_closed')
  if bid_closed != null and bid_closed.val() == 'true'
    alert 'Bidding closed. Please select next player!'
    return false
  if bid_amount.match(/^[0-9]+$/) == null
    alert 'Incorrect format!'
    return false
  if parseInt(bid_amount) < parseInt(base_points)
    alert 'Bid points is lesser than base price. Please increase bid points!'
    return false
  if currentBid != null and parseInt(currentBid.val()) >= parseInt(bid_amount)
    alert 'Please increase bid points!'
    return false
  if parseInt(balance) - (((parseInt(totalNoOfPlayers) - 1) - parseInt(noOfPlayers)) * 5) < parseInt(bid_amount)
    alert 'Insufficient balance! Remember you need to have ' + parseInt(totalNoOfPlayers) + ' players in your team!'
    return false
  if parseInt(noOfPlayers) == parseInt(totalNoOfPlayers)
    alert 'You currently have ' + parseInt(totalNoOfPlayers) + ' players. You cannot bid anymore!'
    return false
  true

$(document).on 'turbolinks:load', ->
  $('#bid-btn').on "click", (event)  ->
    if validateBidding() == true
      bid_amount = $('#bid_amount').val()
      auction_player_id = $('#auction_player_id').val()
      auction_team_id = $('#auction_team_id').val()
      console.log('inside form')
      App.room.call_bid bid_amount, auction_player_id, auction_team_id
      event.target.value = ""
      event.preventDefault()
    else
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
