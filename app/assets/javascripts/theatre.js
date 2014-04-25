var aud_id = gon.aud_id;
var tag = document.createElement('script');

tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

      // 3. This function creates an <iframe> (and YouTube player)
      //    after the API code downloads.
var aud_player;
function onYouTubeIframeAPIReady() {
	      aud_player = new YT.Player('audio', {
          height: '390',
          width: '640',
          videoId: aud_id,
          playerVars: { 'controls': 0 },
          events: {
            'onReady': onAudReady,
          }
        });
      }

      // 4. The API will call this function when the video player is ready.
function onAudReady(event) {
		event.target.setVolume(100);
		event.target.playVideo();
      }

function stopVideo() {
	aud_player.stopVideo();
}

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
$(document).ready(function(){
  $(".next-button").click(function(){
    $("#new-gif-form").submit();
  })
})

$(window).load(format_image)
