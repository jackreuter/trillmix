json.array!(@videosongs) do |videosong|
  json.extract! videosong, :id, :video_url, :song_url, :likes
  json.url videosong_url(videosong, format: :json)
end
