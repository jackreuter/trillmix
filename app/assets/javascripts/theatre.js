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

