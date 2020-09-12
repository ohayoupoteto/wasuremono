App.room = App.cable.subscriptions.create "RoomChannel",


  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    
    
    if data['isAdmin'] is true
      #alert "管理人からのメッセージ：#{data['message']}"
      word="<div class='balloon6'><div class='faceicon'><img src='' alt='ここに画像'></div><div class='chatting'><div class='says'><p>#{data['message']}</p></div></div></div>"
      $(".alert-con").text("管理人からのメッセージ：#{data['message']}")
      $(".alert-box").show();
    else
      word="<div class='balloon6'><div class='faceicon'><img src='' alt='ここに画像'></div><div class='chatting'><div class='says'><p>#{data['message']}</p></div></div></div>"
      $(".alert-con").text("生徒からのメッセージ：#{data['message']}")
      $(".alert-box").show();
    $('#chats').append(word)
    #alert data['message']
    # Called when there's incoming data on the websocket for this channel

  speak_admin: (message) ->
    @perform 'speak_admin', message: message , user_id: $('#user_id_admin').val(), currentAdmin: $('#user_id_admin').attr("value2")
  
  speak_student: (message) ->
    @perform 'speak_student', message: message, user_id: $('#user_id_student').val(), currentAdmin: $('#user_id_admin').attr("value2")

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