

ready = ->
  $('nav #open-mobile-menu').click (e) ->
    e.preventDefault()
    $('nav').toggleClass('open')
$(document).ready(ready)
$(document).on('page:load', ready)
