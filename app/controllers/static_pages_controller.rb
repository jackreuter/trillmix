class StaticPagesController < ApplicationController

  def home
    @youtube_dev_key = "AI39si6_Eb75Wn08iBW2tQbPhzYEKuFuu1tBu_wF2QdcitIJz7rRVeZu4Z-MqvuRyyfjgaqXOWsSuT7LgWcLVaEh1oOS1vg1RA"
    @client = YouTubeIt::OAuth2Client.new(dev_key: @youtube_dev_key)
    @videos = @client.videos_by(:query => "ratatat", :page => rand(100), :per_page => 1).videos
    @audio_id = @videos[0].video_id[-11..-1] #Change this to make it cleaner later
    @audio_url = "http://www.youtube.com/embed/" + @audio_id + "?autoplay=1"
  end

  def theatre
    if (params['gif'] != "")
      gif = Giphy.random
      while (gif.tags.include?('meme') || gif.tags.include?('memes')) do 
        gif = Giphy.random
      end
      @gif_url = "http://media.giphy.com/media/" + gif.id + "/giphy.gif"
    else
      gif_query = params['gif']
      n = rand(100)
      gifs = Giphy.search(gif_query, {limit: 1, offset: n})
      gif = gifs[0]
      @gif_url = "http://media.giphy.com/media/" + gif.id + "/giphy.gif"
    end
  end
  def video_theatre
  	@youtube_dev_key = "AI39si6_Eb75Wn08iBW2tQbPhzYEKuFuu1tBu_wF2QdcitIJz7rRVeZu4Z-MqvuRyyfjgaqXOWsSuT7LgWcLVaEh1oOS1vg1RA"
  	client = YouTubeIt::OAuth2Client.new(dev_key: @youtube_dev_key)
  	aud_query = params['vid_aud']
    vid_query = params['vid']
    audio_videos = client.videos_by(:query => aud_query, :page => 1, :per_page => 50).videos 
  	visual_videos = client.videos_by(:query => vid_query, :page => 1, :per_page => 50).videos
 	  n = rand(50)
 	  m = rand(50)
 	  @audio = audio_videos[n]
 	  @video = visual_videos[m]	
    gon.aud_id = @audio.video_id[-11..-1]
    gon.vid_id = @video.video_id[-11..-1]
  end
end

=begin
    @youtube_dev_key = "AI39si6_Eb75Wn08iBW2tQbPhzYEKuFuu1tBu_wF2QdcitIJz7rRVeZu4Z-MqvuRyyfjgaqXOWsSuT7LgWcLVaEh1oOS1vg1RA"
    client = YouTubeIt::OAuth2Client.new(dev_key: @youtube_dev_key)
    aud_query = params['gif_aud']
    videos = client.videos_by(:query => aud_query, :page => 1, :per_page => 50).videos
    n = rand(50)
    @audio = videos[n]
    gon.aud_id = @audio.video_id[-11..-1]
=end