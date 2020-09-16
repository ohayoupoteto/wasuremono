App.matter = App.cable.subscriptions.create "MatterChannel",
  connected: ->
    console.log("connect!");
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log("disconnect!");

  received: (data) ->
    $(".alert-con").text("申請が届きました")
    $(".alert-matter").show();
    
    
    # Called when there's incoming data on the websocket for this channel

  make: -> 
    @perform 'make'
    

$(document).on 'click', '#matter_make', (event) ->
  App.matter.make()
 
  