$(document).ready ->
  slider = $('.mod-carousel .slides_wrap')

  slider.flexslider({
    animation: 'slide',
    slideshow: false,
    controlNav: false,
    start: (slider) ->
      highlight_tab(slider.currentSlide)
    after: (slider) ->
      highlight_tab(slider.currentSlide)
  })

  $('.mod-carousel .tabs li').each ->
    $(@).click ->
      slider.flexslider($(@).index())
      return false

highlight_tab = (idx) ->
  tabs = $('.mod-carousel .tabs li')
  tabs.removeClass('active').eq(idx).addClass('active')
