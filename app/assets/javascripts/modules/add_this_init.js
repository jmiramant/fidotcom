
var addthis_config = {
  username: 'ra-507041e704ba4467'
}
$(function(){
  // data-addthis="true"
  $("[data-addthis='true']").each(function(i, el){
    var addthis_div = $("<div class='addthis_toolbox addthis_default_style'></div>");
    $this = $(this);
    $this.empty();
    var id = 'addthis-tollbox-'+ i;
    addthis_div.attr('id', id);
    var url = $this.data('url') || window.location.href;
    var title = $this.data('title') || document.title;
    var description = $this.data('description');
    var svcs = {};
    var fb = $this.data('facebook');
    if(fb){
      svcs["facebook_like"] = "Facebook";
    }
    var tw = $this.data("twitter");
    if(tw){
      svcs["tweet"] = "Twitter";
    }
    var pin = $this.data("pinterest");
    if(pin){
      svcs["pinterest"] = "Pinterest";
    }
    var email = $this.data('email');
    if(email){
      svcs["email"] = "Email";
    }
    for (var s in svcs) {
      if(s === 'facebook'){
        addthis_div.append('<a class="addthis_button_'+s+'" fb:like:layout="button_count"></a>');
      }
      else if( s === 'tweet') {
        
        addthis_div.append('<a class="addthis_button_'+s+'" tw:via="everfi" tw:text="'+title+'"></a>');
      }
      else {
        addthis_div.append('<a class="addthis_button_'+s+'"></a>');
      }
    }
    addthis_div.append("<a class='addthis_counter addthis_pill_style'></a>");
    $this.replaceWith(addthis_div);

    var addthis_share = {
      url: url,
      title: title,
      description: description
    }
    addthis.toolbox('#'+id, addthis_config, addthis_share);

  })

})
