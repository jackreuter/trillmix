class StaticPagesController < ApplicationController
  def theatre
  	@youtube_dev_key = "AI39si6_Eb75Wn08iBW2tQbPhzYEKuFuu1tBu_wF2QdcitIJz7rRVeZu4Z-MqvuRyyfjgaqXOWsSuT7LgWcLVaEh1oOS1vg1RA"
  	client = YouTubeIt::OAuth2Client.new(dev_key: @youtube_dev_key)
  	videos = client.videos_by(:query => "ratatat", :page => 1, :per_page => 20).videos
  	n = rand(20)
  	@video = videos[n]
  end
  def video_theatre
  	@youtube_dev_key = "AI39si6_Eb75Wn08iBW2tQbPhzYEKuFuu1tBu_wF2QdcitIJz7rRVeZu4Z-MqvuRyyfjgaqXOWsSuT7LgWcLVaEh1oOS1vg1RA"
  	client = YouTubeIt::OAuth2Client.new(dev_key: @youtube_dev_key)
  	audio_videos = client.videos_by(:query => 'ratatat', :page => 3, :per_page => 20).videos 
  	visual_videos = client.videos_by(:query => 'trippy animations', :page => 1, :per_page => 20).videos
 	n = rand(20)
 	m = rand(20)
 	@audio = audio_videos[n]
 	@video = visual_videos[m]	
  end
end
