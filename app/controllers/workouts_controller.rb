class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show]

  def create
  end

  def show
  end

  def index
    @workouts = Workout.where(user_id: current_user.id)
  end

  private

  def set_workout
    @workout = Workout.find(params[:id])
  end
end
