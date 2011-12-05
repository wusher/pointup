$ -> 
  $('body').delegate "#basecamp-sync", 'ajax:success', -> 
    $(@).removeClass("waiting")
  $('body').delegate "#basecamp-sync", 'ajax:failure', -> 
    alert("sync failed")
  $('body').delegate "#basecamp-sync", 'ajax:beforeSend', -> 
    $(@).addClass("waiting")

