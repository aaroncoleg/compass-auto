# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#inventory_model_id').parent().hide()
  models = $('#inventory_model_id').html()
  $('#inventory_make_id').change ->
    make = $('#inventory_make_id :selected').text()
    options = $(models).filter("optgroup[label='#{make}']").html()
    if options
      $('#inventory_model_id').html(options)
      $('#inventory_model_id').parent().show()
    else
      $('#inventory_model_id').empty()
      $('#inventory_model_id').parent().hide()
