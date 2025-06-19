class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :exercise

  validates :value, inclusion: { in: 1..5 }
  validates :user_id, uniqueness: { scope: :exercise_id }
end
