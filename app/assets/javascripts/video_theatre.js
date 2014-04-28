
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
            'onReady': onAudioReady
          }
        });
      }

      // 4. The API will call this function when the video player is ready.
function onVideoReady(event) {
		event.target.setVolume(0);
		event.target.playVideo();
      }

function onAudioReady(event) {
		event.target.setVolume(100);
		event.target.playVideo();
      }

function onVidStateChange(event) {
  if (event.data == YT.PlayerState.ENDED){
    event.target.stopVideo();
  }

}

