# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  allPanels = $('.category_container > .nested_categories:has(.nested_categories)')
  firstLevelItems = $('.category_container > .category_item.first_level_item')

  firstLevelItems.click ->
    if !($(this).hasClass('active'))
      firstLevelItems.removeClass('active')
      allPanels.slideUp()
      $(this).next('.nested_categories').slideDown()
      $(this).addClass('active')
    else
      allPanels.slideUp()
      firstLevelItems.removeClass('active')