$(document).ready(function(){

  var turnOnPanel = function(num){
    $('.cover.on').removeClass('on')
    return $('.cover-'+num).addClass('on');
  }

  var panels = []
  panels[1] = 1
  panels[6] = 1

  panels[2] = 2
  panels[3] = 2
  panels[7] = 2

  panels[4] = 3
  panels[5] = 3
  panels[8] = 3

  panels[9] = 4

  panels[10] = 5
  panels[11] = 5

  panels[12] = 6

  function applyLeaveEvent(panel, n){
    panel.on("mouseleave", '.coverlet', function(e){
      // Don't close the panel if hovering another part of the
      // panel that isn't the initial mouseenter element
      var coverN = $(e.target).parents('.cover').data('cover');
      if(panel.data('cover') == coverN) return;
      panel.removeClass('on');
    })
  }

  $('.careers-widget').each(function(){
    var widget = $(this);
    widget.on('mouseenter', '[data-image]', function(e){
      var image = $(this);
      var num = image.data('image');
      var n = panels[num];
      if(typeof n != 'undefined'){
        var panel = turnOnPanel(n);
        applyLeaveEvent(panel, n);
      }
    }).on('mouseleave', function(){
      $(this).find('.on').removeClass('on');
    });

    $('.coverlet').on('click',function(e){
      window.location = $(this).parent().find('a').attr('href')
      e.stopPropagation();
    })

  })
});
