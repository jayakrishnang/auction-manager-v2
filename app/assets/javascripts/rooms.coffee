App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready on the server
  disconnected: ->
    # Called when the subscription has been terminated by the server
  received: (data) ->
    # Called after the server has received and processed the bid
    # The line below appends the new bid to other bids
    $('#bid').append(data['bid'])
  bid: (bid) ->
    @perform 'bid', bid: bid
$(document).on 'keypress', '#room_speaker', (event) ->
  if event.keyCode is 13 # return = send
    # Call bid from the method defined above
    App.room.bid event.target.value
    # Set input to be empty after the bid gets to the server
    event.target.value = ''
    # Prevent form from reloading
    event.preventDefault()
