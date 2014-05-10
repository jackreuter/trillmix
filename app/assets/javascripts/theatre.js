function format_image(){
  var width = parseInt($(".gif").css("width"))
  var height = parseInt($(".gif").css("height")) 
  if (height > 500)
  {
    $(".gif").css({"visibility": "visible", "height":"100%", "width" : "auto"})
  } 
  else
  {
    var target_margin = (500 - height) / 2
    var target_margin_string = target_margin + "px"
    $(".gif").css({"visibility": "visible", "vertical-align":"middle", "margin-top" : target_margin_string})

  }
}

function fullscreen(){
  var elem = document.getElementById("gif");
  req = elem.requestFullScreen || elem.webkitRequestFullScreen || elem.mozRequestFullScreen || elem.msRequestFullscreen;
  req.call(elem);
};



$(window).load(function(){
  $("#fullscreen-button").click(function(){
    fullscreen();
  })
});

$(window).load(function(){format_image()});

