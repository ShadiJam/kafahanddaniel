class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :attending
      t.integer :number_of_attendees
      t.text :food_allergies

      t.timestamps
    end
  end
end
