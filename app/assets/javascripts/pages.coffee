# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('.page-order-container').sortable({
    axis: 'y'
  })
  $('.page-order-form').submit ->
    # $('.page-order-input').val(
    #   $('.page-order-container').sortable('serialize')
    # )
    $.ajax({
      type: "POST",
      url: $(this).attr("action"),
      dataType: "json",
      data: $(".page-order-container").sortable('serialize')
      success: ->
        window.location.reload(true)
    })
    false
$(document).ready(ready)
$(document).on('page:load', ready)
