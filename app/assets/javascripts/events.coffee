$ ->
  $('#list-events').infinitePages
    loading: ->
      $(this).text('Loading next page...')
    error: ->
      $(this).button('There was an error, please try again')
