# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery -> 

  categories = $('#dish_category_id').html()
  setCategoryMenu = ->
    menu = $('#dish_menu_id :selected').text()
    console.log(menu)
    options = $(categories).filter("optgroup[label='#{menu}']").html()
    console.log(options)
    if options 
      $('#dish_category_id').html(options)
      $('#dish_category_id').parent().show()
    else
      $('#dish_category_id').empty()
      $('#dish_category_id').parent().hide()
  $('#dish_menu_id').change setCategoryMenu
  setCategoryMenu()


  $('form').on 'click', '.remove_ingredients', (event) -> 
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault


  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()