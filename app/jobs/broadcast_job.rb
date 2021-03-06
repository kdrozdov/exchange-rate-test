class BroadcastJob < ActiveJob::Base
  queue_as :default

  def perform(channel, message)
    ActionCable.server.broadcast(channel, message)
  end
end
