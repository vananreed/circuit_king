class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show]

  def create
    respond_to do |format|
      format.html { redirect_to workouts_path }
      format.js
    end
  end

  def show
  end

  def index
    @workouts = Workout.where(user_id: current_user.id).order(created_at: :desc)
  end

  private

  def set_workout
    @workout = Workout.find(params[:id])
  end
end
