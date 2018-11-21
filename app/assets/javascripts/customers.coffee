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