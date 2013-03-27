# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  allPanels = $('.category_container > .nested_categories:has(.nested_categories)')
  firstLevelItems = $('.category_container > .category_item.first_level_item')

  firstLevelItems.click ->
    if (($(document).width()) < 1280) || !($('body').hasClass('categories-index'))
      if !($(this).hasClass('active'))
        firstLevelItems.removeClass('active')
        allPanels.slideUp()
        $(this).next('.nested_categories').slideDown()
        $(this).addClass('active')
      else
        allPanels.slideUp()
        firstLevelItems.removeClass('active')





  itemSelector_opt = $('.category_container').has(".category_item.first_level_item")


  if (($(document).width()) > 1280) && ($('body').hasClass('categories-index'))
    $('.catalog_bar').masonry({
      itemSelector : itemSelector_opt,
      columnWidth : 240,
      isAnimated: true
    })

  $(window).resize ->
    if (($(document).width()) > 1280) && ($('body').hasClass('categories-index'))
      $('.catalog_bar').masonry({
        itemSelector : itemSelector_opt,
        columnWidth : 240,
        isAnimated: true
      })
    else
      $('.catalog_bar').masonry('destroy')








