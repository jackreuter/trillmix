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
      if (gif.nil?)
        gifs = Giphy.search(gif_query, limit: 100, offset: 0)
        n = rand(gifs.length)
        gif = gifs[n]
      end
      @gif_url = "http://media.giphy.com/media/" + gif.id + "/giphy.gif"
      @previous_gif_query = gif_query
    end
    #Audio
    @youtube_dev_key = "AI39si6_Eb75Wn08iBW2tQbPhzYEKuFuu1tBu_wF2QdcitIJz7rRVeZu4Z-MqvuRyyfjgaqXOWsSuT7LgWcLVaEh1oOS1vg1RA"
    client = YouTubeIt::OAuth2Client.new(dev_key: @youtube_dev_key)    
    if (params['aud'].nil? || params['aud'] == "")
      m = rand(108)
      if (m < 10)
        audio_query = "ratatat"
      elsif (m < 15)
        audio_query = "classical"
      elsif (m < 30) 
        audio_query = "majestic casual"
      elsif (m < 35)
        audio_query = "gil scott heron remix"
      elsif(m < 40)
        audio_query = "beach house"
      elsif(m < 45)
        audio_query = "biggie"
      elsif(m < 50)
        audio_query = "juanes"
      elsif(m < 55)
        audio_query = "bebob"
      elsif(m < 60)
        audio_query = "mgmt"
      elsif(m < 65)
        audio_query = "animal collective"
      elsif(m < 66)
        audio_query = "baha men"
      elsif(m < 67)
        audio_query = "camron"
      elsif(m < 75)
        audio_query = "le1f"
      elsif(m < 76)
        audio_query = "sean kingston"
      elsif(m < 77)
        audio_query = "swedish house mafia"
      elsif(m < 78)
        audio_query = "deadmau5"
      elsif(m < 85)
        audio_query = "rolling stones"
      elsif(m < 88)
        audio_query = "atmosphere music"
      elsif(m < 90)
        audio_query = "future"
      elsif(m < 92)
        audio_query = "outkast"
      elsif(m < 94)
        audio_query = "kendrick lamar"
      elsif(m < 96)
        audio_query = "beach fossils"
      els(m < 98)
        audio_query = "kanye"
      else
        audio_query = "ratatat"
      end
      n = rand(50)
      @audio = client.videos_by(:categories => [:music], :query => audio_query, :page => n, :per_page => 1).videos[0].video_id                
      @audio_id = @audio[-11..-1]
      gon.aud_id = @audio_id
    else    
      #Kind of random
      n = rand(100)
      audio_query = params['aud']
      @audio = client.videos_by(:categories => [:music], :query => audio_query, :page => n, :per_page => 1).videos[0].video_id
      @audio_id = @audio[-11..-1]
      gon.aud_id = @audio_id
      @previous_audio_query = audio_query
    end
  end



  def video_theatre
  	@youtube_dev_key = "AI39si6_Eb75Wn08iBW2tQbPhzYEKuFuu1tBu_wF2QdcitIJz7rRVeZu4Z-MqvuRyyfjgaqXOWsSuT7LgWcLVaEh1oOS1vg1RA"
  	client = YouTubeIt::OAuth2Client.new(dev_key: @youtube_dev_key)
    #video
    if (params['vid'].nil? || params['vid']== "")
      m = rand(4)
      if (m == 0)
        video_query = "robots"
      elsif (m == 1)
        video_query = "extreme sports"
      elsif (m == 2)
        video_query = "psychadelic"
      else
        video_query = "soul train"
      end
      n = rand(50)
      @video = client.videos_by(:query =>  video_query, :page => n, :per_page => 1).videos[0].video_id
      @video_id = @video[-11..-1]
      gon.vid_id = @video_id
      @previous_video_query =  ""

    else
      n = rand(100)
      video_query = params['vid']
      @video = client.videos_by(:query =>  video_query, :page => n, :per_page => 1).videos[0].video_id
      @video_id = @video[-11..-1]
      gon.vid_id = @video_id
      @previous_video_query = video_query
    end


    #audio
    @youtube_dev_key = "AI39si6_Eb75Wn08iBW2tQbPhzYEKuFuu1tBu_wF2QdcitIJz7rRVeZu4Z-MqvuRyyfjgaqXOWsSuT7LgWcLVaEh1oOS1vg1RA"
    client = YouTubeIt::OAuth2Client.new(dev_key: @youtube_dev_key)    
    if (params['aud'].nil? || params['aud'] == "")
      m = rand(108)
      if (m < 10)
        audio_query = "ratatat"
      elsif (m < 15)
        audio_query = "classical"
      elsif (m < 30) 
        audio_query = "majestic casual"
      elsif (m < 35)
        audio_query = "gil scott heron remix"
      elsif(m < 40)
        audio_query = "beach house"
      elsif(m < 45)
        audio_query = "biggie"
      elsif(m < 50)
        audio_query = "juanes"
      elsif(m < 55)
        audio_query = "bebob"
      elsif(m < 60)
        audio_query = "mgmt"
      elsif(m < 65)
        audio_query = "animal collective"
      elsif(m < 66)
        audio_query = "baha men"
      elsif(m < 67)
        audio_query = "camron"
      elsif(m < 75)
        audio_query = "le1f"
      elsif(m < 76)
        audio_query = "sean kingston"
      elsif(m < 77)
        audio_query = "swedish house mafia"
      elsif(m < 78)
        audio_query = "deadmau5"
      elsif(m < 85)
        audio_query = "rolling stones"
      elsif(m < 88)
        audio_query = "atmosphere music"
      elsif(m < 90)
        audio_query = "future"
      elsif(m < 92)
        audio_query = "outkast"
      elsif(m < 94)
        audio_query = "kendrick lamar"
      elsif(m < 96)
        audio_query = "beach fossils"
      elsif(m < 98)
        audio_query = "kanye"
      else
        audio_query = "ratatat"
      end
      n = rand(50)
      @audio = client.videos_by(:categories => [:music], :query => audio_query, :page => n, :per_page => 1).videos[0].video_id                
      @audio_id = @audio[-11..-1]
      gon.aud_id = @audio_id
    else    
      #Kind of random
      n = rand(100)
      audio_query = params['aud']
      @audio = client.videos_by(:categories => [:music], :query => audio_query, :page => n, :per_page => 1).videos[0].video_id
      @audio_id = @audio[-11..-1]
      gon.aud_id = @audio_id
      @previous_audio_query = audio_query
    end  
  end
end

