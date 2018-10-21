class BidBroadcastJob < ApplicationJob
  queue_as :default
  def perform(bid)
    # broadcast bid so that all subscribers can have access to it.
    ActionCable.server.broadcast 'room_channel', bid: render_bid(bid)
  end
  private
    def render_bid(bid)
      # This is also a new feature in Rails 5. The controller renderer has been 
      # extracted from the controller instance and can now be called as a class 
      # method
      ApplicationController.renderer.render(partial: 'bids/bid', locals: { bid: bid })
    end
end
