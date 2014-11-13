jQuery(document).ready(function($){

  $('.menu-options a.hours').click(function() {

    // get selected item
    var $item = $('.menu-list' + $(this).data('list'));

    // remove any selected classes before changing hour lists
    $('.menu-options .selected').removeClass('selected');

    // hide all existing items
    $('.menu-list').removeClass('list-animation');
    $('.menu-list').addClass('hidden');

    // check if the menu-items are hidden behind the button
    if ($item.hasClass('hidden')) {
      // add class to make the menu-items drop down
      $item.addClass('list-animation');
      // the following items trigger the animation after a certain delay
      $item.removeClass('hidden');
    }

  });

});
