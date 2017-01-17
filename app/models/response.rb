class Response < ApplicationRecord
  validates :full_name, :attending?, :number_of_attendees, :food_allergies, :song_title, :singer, :comment, presence: true
end
