class AddSongTitleToResponse < ActiveRecord::Migration[5.0]
  def change
    add_column :responses, :song_title, :string
  end
end
