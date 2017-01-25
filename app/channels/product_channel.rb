# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ProductChannel < ApplicationCable::Channel
  def subscribed #is called the moment a user subscribes to this channel.
    # stream_from "some_channel"
    stream_from "product_channel" # if users subscribe to the channel, they start "streaming" all the updates
  end

  def unsubscribed #called as soon as a user leaves the channel (e.g. by closing the browser window)
    # Any cleanup needed when channel is unsubscribed
  end
end

