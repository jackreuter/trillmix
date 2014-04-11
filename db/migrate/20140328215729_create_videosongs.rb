class CreateVideosongs < ActiveRecord::Migration
  def change
    create_table :videosongs do |t|
      t.string :video_url
      t.string :song_url
      t.integer :likes

      t.timestamps
    end
  end
end
