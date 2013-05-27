$insert_addthis_link = "<ul id='add_add_this'><li><a href='/refinery/add_this/insert?dialog=true'>Add Addthis</a></li></ul>";
window.onload = function ()
{
  if ($.wymeditors(0)) {
    $('.wym_area_top').append($insert_addthis_link);
    init_modal_dialogs();
  }
};

onCloseDialog = function(){
  $('iframe#dialog_iframe').attr('src', '');
};


