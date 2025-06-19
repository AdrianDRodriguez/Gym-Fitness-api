class Exercise < ApplicationRecord
  has_many :ratings

  def average_rating
    ratings.average(:value).to_f.round(1)
  end
end
