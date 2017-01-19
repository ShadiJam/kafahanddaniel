class Response < ApplicationRecord
  validates :full_name, presence: true
  validates_numericality_of :number_of_attendees, :only_integer => true

  def self.to_csv
    attributes = %w{full_name attending number_of_attendees food_allergies song_title singer comment}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |response|
        csv << response.attributes.values_at(*attributes)
      end
    end
  end

  def total_attendees
    attArr = Array.new
    attArr.sum { |a| a.number_of_attendees }
  end
end
