class StaticPagesController < ApplicationController
  def theatre
  	@youtube_dev_key = "AI39si6_Eb75Wn08iBW2tQbPhzYEKuFuu1tBu_wF2QdcitIJz7rRVeZu4Z-MqvuRyyfjgaqXOWsSuT7LgWcLVaEh1oOS1vg1RA"
  	client = YouTubeIt::OAuth2Client.new(dev_key: @youtube_dev_key)
  	videos = client.videos_by(:query => "gil scott heron remix", :page => 1, :per_page => 50).videos
  	n = rand(50)
  	@audio = videos[n]
    gon.aud_id = @audio.video_id[-11..-1]
  end
  def video_theatre
  	@youtube_dev_key = "AI39si6_Eb75Wn08iBW2tQbPhzYEKuFuu1tBu_wF2QdcitIJz7rRVeZu4Z-MqvuRyyfjgaqXOWsSuT7LgWcLVaEh1oOS1vg1RA"
  	client = YouTubeIt::OAuth2Client.new(dev_key: @youtube_dev_key)
  	audio_videos = client.videos_by(:query => 'flying lotus', :page => 3, :per_page => 50).videos 
  	visual_videos = client.videos_by(:query => 'weird animation', :page => 1, :per_page => 50).videos
 	n = rand(50)
 	m = rand(50)
 	@audio = audio_videos[n]
 	@video = visual_videos[m]	
  gon.aud_id = @audio.video_id[-11..-1]
  gon.vid_id = @video.video_id[-11..-1]
  end
  def home
  end
end
