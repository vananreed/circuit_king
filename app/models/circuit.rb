class Circuit < ApplicationRecord
  has_many :circuit_exercises
  has_many :exercises, through: :circuit_exercises
end
