
var vid_id = gon.vid_id;
var aud_id = gon.aud_id;

var tag = document.createElement('script');

tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

      // 3. This function creates an <iframe> (and YouTube player)
      //    after the API code downloads.
var vid_player;
var aud_player;

function onYouTubeIframeAPIReady() {
	      vid_player = new YT.Player('video', {
          height: '500',
          width: '900',
          videoId: vid_id,
          events: {
            'onReady': onVideoReady,
            'onStateChange': onVidStateChange
          }
        });
	      aud_player = new YT.Player('audio', {  
          height: '390',
          width: '640',
          videoId: aud_id,
          events: {
            'onReady': onAudioReady,
          }
        });
      }

      // 4. The API will call this function when the video player is ready.
function onVideoReady(event) {
		event.target.setVolume(0);
		event.target.playVideo()

}

function onAudioReady(event) {
	event.target.setVolume(100);
	event.target.playVideo();

  var pauseButton = document.getElementById("pause-button");
  pauseButton.addEventListener("click", function() {
    if (event.target.getPlayerState() == 1)
    {
      event.target.pauseVideo();
      $("#pause-button").removeClass("fa-pause");
      $("#pause-button").addClass("fa-play");
      $(".pause-wrapper").css({"padding": "6px 0px 0px 5px"});
      gif_src = $("#gif").attr('src')
      $("#gif").attr('src', 'http://clipartist.info/www/COLOURINGBOOK.ORG/Letters/M/media_playback_pause_black_white_line_art_coloring_book_colouring-1331px.png')
      $("#gif").addClass("paused")
    }
    else if (event.target.getPlayerState() == 2)
    {
      event.target.playVideo();
      $("#pause-button").removeClass("fa-play");
      $("#pause-button").addClass("fa-pause");
      $(".pause-wrapper").css({"padding": "6px 0px 0px 0px"});  
      $("#gif").attr('src', gif_src);    
      $("#gif").removeClass("paused")      
    }
  });

}

function onVidStateChange(event) {
  if (event.data == YT.PlayerState.ENDED){
    event.target.stopVideo();
  }
  if (event.target.getPlayerState() == 2)
  {
    aud_player.pauseVideo();
  }
  if (event.target.getPlayerState() == 1)
  {
    aud_player.playVideo();
  }
}

$(document).ready(function(){
  $(".next-button").click(function(){
    $(".new-random-content-form").submit();
  })
})

function submit_on_enter(object){
  object.keypress(function(event) {
    if (event.which == 13)
    {
      $(".new-random-content-form").submit();
    }
  });
}

$(document).ready(function() {
  submit_on_enter($(".form-control-new-random-content"))
  }
);






























