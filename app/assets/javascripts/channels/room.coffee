App.room = App.cable.subscriptions.create "RoomChannel",


  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if data['isAdmin'] is true
      word="<p style='text-align:right;'>メッセージ:#{data['message']}<br></p>"
    else
      word="<p style='text-align:left;'>メッセージ:#{data['message']}<br></p>"
    $('#chats').append(word)
    #alert data['message']
    # Called when there's incoming data on the websocket for this channel

  speak_admin: (message) ->
    @perform 'speak_admin', message: message , user_id: $('#user_id_admin').val()
  
  speak_student: (message) ->
    @perform 'speak_student', message: message, user_id: $('#user_id_student').val()

  $(document).on 'keypress', '[data-behavior~=room_speaker_admin]', (event) ->
    if event.keyCode is 13 # return = send
      App.room.speak_admin(event.target.value)
      event.target.value = ''
      event.preventDefault()

  $(document).on 'keypress', '[data-behavior~=room_speaker_student]', (event) ->
    if event.keyCode is 13 # return = send
      App.room.speak_student(event.target.value)
      event.target.value = ''
      event.preventDefault()