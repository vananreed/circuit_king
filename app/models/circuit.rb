class Circuit < ApplicationRecord
  has_many :circuit_exercises, dependent: :destroy
  has_many :exercises, through: :circuit_exercises
  validates :name, presence: true
  has_many :workouts
end
