class StaticPagesController < ApplicationController

  def home
    @youtube_dev_key = "AI39si6_Eb75Wn08iBW2tQbPhzYEKuFuu1tBu_wF2QdcitIJz7rRVeZu4Z-MqvuRyyfjgaqXOWsSuT7LgWcLVaEh1oOS1vg1RA"
    @client = YouTubeIt::OAuth2Client.new(dev_key: @youtube_dev_key)
    @videos = @client.videos_by(:query => "ratatat", :page => rand(100), :per_page => 1).videos
    @audio_id = @videos[0].video_id[-11..-1] #Change this to make it cleaner later
    @audio_url = "http://www.youtube.com/embed/" + @audio_id + "?autoplay=1"
  end

  def theatre
    #Visual
    if (params['gif'].nil? || params['gif'] == "")
      gif = Giphy.random
      while (gif.tags.include?('meme') || gif.tags.include?('memes')) do 
        gif = Giphy.random
      end
      @gif_url = "http://media.giphy.com/media/" + gif.id + "/giphy.gif"
      @test = "no search"
      @previous_gif_query = ""
    else
      gif_query = params['gif']
      n = rand(100)
      gifs = Giphy.search(gif_query, {limit: 1, offset: n})
      gif = gifs[0]
      @gif_url = "http://media.giphy.com/media/" + gif.id + "/giphy.gif"
      @previous_gif_query = params['gif']
    end
    #Audio
    @youtube_dev_key = "AI39si6_Eb75Wn08iBW2tQbPhzYEKuFuu1tBu_wF2QdcitIJz7rRVeZu4Z-MqvuRyyfjgaqXOWsSuT7LgWcLVaEh1oOS1vg1RA"
    client = YouTubeIt::OAuth2Client.new(dev_key: @youtube_dev_key)    
    if (params['gif'].nil? || params['gif'] == "")
      @audio_id = "Ehk6m2seDTE"
      gon.aud_id = @audio_id
      @previous_audio_query = ""     
    else    
      #Kind of random
      n = rand(100)
      audio_query = params['aud']
      @audio = client.videos_by(:categories => [:music], :query => params['aud'], :page => n, :per_page => 1).videos[0].video_id
      @audio_id = @audio[-11..-1]
      gon.aud_id = @audio_id
      @previous_audio_query = params['aud']
    end
  end



  def video_theatre
  	@youtube_dev_key = "AI39si6_Eb75Wn08iBW2tQbPhzYEKuFuu1tBu_wF2QdcitIJz7rRVeZu4Z-MqvuRyyfjgaqXOWsSuT7LgWcLVaEh1oOS1vg1RA"
  	client = YouTubeIt::OAuth2Client.new(dev_key: @youtube_dev_key)
    #video
    if (params['vid'].nil? || params['']== "")
      #####
      @previous_video_query = ""    
    else
      n = rand(100)
      video_query = params['vid']
      @audio = client.videos_by(:categories => [:music], :query => params['vid'], :page => n, :per_page => 1).videos[0].video_id
      @video_id = @video[-11..-1]
      gon.vid_id = @video_id
      @previous_video_query = params['vid']
    end


    #audio
    if (params['gif'].nil? || params['gif'] == "")
      @audio_id = "Ehk6m2seDTE"
      gon.aud_id = @audio_id
      @previous_audio_query = ""     
    else    
      #Kind of random
      n = rand(100)
      audio_query = params['aud']
      @audio = client.videos_by(:categories => [:music], :query => params['aud'], :page => n, :per_page => 1).videos[0].video_id
      @audio_id = @audio[-11..-1]
      gon.aud_id = @audio_id
      @previous_audio_query = params['aud']
    end    
  end
end

