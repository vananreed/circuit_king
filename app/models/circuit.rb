class Circuit < ApplicationRecord
  has_many :circuit_exercises
  has_many :exercises, through: :circuit_exercises
  validates :name, presence: true
end
