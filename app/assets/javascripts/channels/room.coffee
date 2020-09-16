App.room = App.cable.subscriptions.create "RoomChannel",


  connected: ->
   

  disconnected: ->
    

  received: (data) ->
    
    if data['isAdmin'] is true
      word_other="<div class='balloon6'><div class='faceicon'><img src='/assets/admin.png' alt='管理人'></div><div class='chatting'><div class='says'><p>#{data['message']}</p></div></div></div>"
      word_myself="<div class='mycomment'><p>#{data['message']}</p></div>"
      $(".alert-con").text("#{data['message']}")
      $(".alert-by-admin").show()
      if data['currentAdmin'] is true
        $('#chats').append(word_myself)
      else
        $('#chats').append(word_other)
        
    else
      word_other="<div class='balloon6'><div class='faceicon'><img src='/assets/student.png' alt='生徒'></div><div class='chatting'><div class='says'><p>#{data['message']}</p></div></div></div>"
      word_myself="<div class='mycomment'><p>#{data['message']}</p></div>"
      $(".alert-con").text("#{data['message']}")
      $(".alert-by-student").show()
      if data['currentAdmin'] is true
        $('#chats').append(word_other)
      else
        $('#chats').append(word_myself)
    #alert data['message']
    

  speak_admin: (message) ->
    @perform 'speak_admin', message: message , user_id: $('#user_id_admin').val(), currentAdmin: $('#user_id_admin').attr("value2")
  
  speak_student: (message) ->
    @perform 'speak_student', message: message, user_id: $('#user_id_student').val(), currentAdmin: $('#user_id_student').attr("value2")

  $(document).on 'keypress', '[data-behavior~=room_speaker_admin]', (event) ->
    if event.keyCode is 13 
      App.room.speak_admin(event.target.value)
      event.target.value = ''
      event.preventDefault()

  $(document).on 'keypress', '[data-behavior~=room_speaker_student]', (event) ->
    if event.keyCode is 13 
      App.room.speak_student(event.target.value)
      event.target.value = ''
      event.preventDefault()