class Exercise < ApplicationRecord
  validates :name, presence: true
  has_many :circuit_exercises
  has_many :circuits, through: :circuit_exercises
end
