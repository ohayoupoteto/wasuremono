class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak_admin(data)
    Chat.create!(sentence: data['message'], isAdmin: true, is_solved: false, user_id: data['user_id'].to_i)
    ActionCable.server.broadcast 'room_channel', message: data['message'], isAdmin: true, currentAdmin: data['currentAdmin']
  end

  def speak_student(data)
    Chat.create!(sentence: data['message'], isAdmin: false, is_solved: false, user_id: data['user_id'].to_i)
    ActionCable.server.broadcast 'room_channel', message: data['message'], isAdmin: false, currentAdmin: data['currentAdmin']
  end
  private def current_user
    if session[:user_id]
        User.find_by(id:session[:user_id])
    end
end
end
