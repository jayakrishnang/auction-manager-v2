class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  def bid(data)
    Bid.create! bid_amount: data['bid_amount']
  end
end
