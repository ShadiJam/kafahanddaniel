class Response < ApplicationRecord
  validates :first_name, :last_name, :attending?, :number_of_attendees, :food_allergies, :song_title, :singer, :comment, presence: true
end
