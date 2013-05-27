$(document).ready(function(){
  try{
    $('.about.people > p').each(function(i, p){
      var n = i % 3,
        c,
        person = $(p);
      if(n === 0){
        c = 'gray';
      }
      else if(n === 1){
        c = 'white';
      }
      else if(n === 2){
        c = 'black';
      }
      person.addClass(c);
      var titleHeight = person.find('strong').height() + 20;
      var personHeight = person.height();
      var img = person.find('img');
      var imageHeight = img.height();
      // var topVal = ((personHeight - imageHeight) / 2);
      if(imageHeight < personHeight && (titleHeight + imageHeight) < personHeight){
        img.css({'top': titleHeight});
      }
      if(imageHeight+ titleHeight > personHeight){
        person.height(imageHeight+titleHeight);
        img.css({'top': titleHeight});
      }
    })
    var colin = $('p:contains("Colin Van Dyke")');
    colin.rainbowify();
    colin.css({color: '#FFF'});
  }
  catch(e){
  }
})
