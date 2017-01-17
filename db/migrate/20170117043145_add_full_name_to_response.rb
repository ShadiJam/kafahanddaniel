class AddFullNameToResponse < ActiveRecord::Migration[5.0]
  def change
    add_column :responses, :full_name, :string
  end
end
