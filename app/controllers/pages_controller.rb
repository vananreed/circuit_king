class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @exercises = Exercise.all
    @circuits = Circuit.all
    @circuit = Circuit.new
    @circuitExercises = []
    @workout = Workout.new
  end
end
