class MatterChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'matter_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def make
    ActionCable.server.broadcast 'matter_channel',message: "送ってやるか"
  end
end
