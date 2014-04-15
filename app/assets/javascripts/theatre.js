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
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
          }
        });
      }

      // 4. The API will call this function when the video player is ready.
function onPlayerReady(event) {
		event.target.setVolume(100);
		event.target.playVideo();
      }

      // 5. The API calls this function when the player's state changes.
      //    The function indicates that when playing a video (state=1),
      //    the player should play for six seconds and then stop.
var done = false;
function onPlayerStateChange(event) {
        if (event.data == YT.PlayerState.PLAYING && !done) {
          done = true;
        }
      }
function stopVideo() {
	aud_player.stopVideo();
}

