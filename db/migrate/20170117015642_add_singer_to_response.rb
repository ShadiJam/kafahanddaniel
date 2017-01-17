class AddSingerToResponse < ActiveRecord::Migration[5.0]
  def change
    add_column :responses, :singer, :string
  end
end
