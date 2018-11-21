# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
  $('#search_form').submit ->
    $(this).find(':input').filter(->
      !@value
    ).prop 'disabled', true
    true

  # If they hit back
  $('#search_form').find(':input').prop 'disabled', false

  # If they stop page load and click on the form again it enables
  $('#search_form').on 'click', ->
    $(this).find(':input').prop 'disabled', false

  return
