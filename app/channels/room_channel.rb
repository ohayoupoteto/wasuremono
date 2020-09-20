class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
    # stream_from "some_channel"
    stream_for current_user.admin
  end

  def unsubscribed
  end

  def speak_admin(data)
    Chat.create!(sentence: data['message'], isAdmin: true, is_solved: false, user_id: data['user_id'].to_i)
    #今画面を開いているのが管理人か否か判断
    RoomChannel.broadcast_to true, message: data['message'], isAdmin: true, currentAdmin: true
    RoomChannel.broadcast_to false, message: data['message'], isAdmin: true, currentAdmin: false
    @user=User.find(data['user_id'].to_i)
    ChatMailer.send_mail(@user, data['message']).deliver_now
  end

  def speak_student(data)
    Chat.create!(sentence: data['message'], isAdmin: false, is_solved: false, user_id: data['user_id'].to_i)
    #今画面を開いているのが管理人か否か判断
    RoomChannel.broadcast_to true, message: data['message'], isAdmin: false, currentAdmin: true
    RoomChannel.broadcast_to false, message: data['message'], isAdmin: false, currentAdmin: false
  end
end
