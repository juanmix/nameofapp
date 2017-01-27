# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not
# support auto reloading.
class ProductChannel < ApplicationCable::Channel
  def subscribed #is called the moment a user subscribes to this channel.
    # stream_from "some_channel" # example.
    # this next product_channel is global; available on all the website.
    # stream_from "product_channel" # if users subscribe to channel they start "streaming" all updates.

  end

  def unsubscribed #called as soon as a user leaves the channel (e.g. by closing the browser window)
    # Any cleanup needed when channel is unsubscribed.

  end

  def listen(data) #This argument will contain the product id.

    #to make sure a user only streams from a single channel it can be very helpful to stop all streams
    # just to make sure.
    stop_all_streams #default method provided by ActionCable to stop all previous streams.
    stream_for data["product_id"] #we want to stream from a channel that's specific to one of the products.
  end

end

