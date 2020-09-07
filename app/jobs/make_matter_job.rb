class MakeMatterJob < ApplicationJob
  queue_as :default

  def perform
    ActionCable.server.broadcast 'matter_channel'
  end

 
end
