class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show]

  def create
    @w = Workout.create!(length: 1800, calories: rand(300), interval: 30, user: current_user, circuit: Circuit.find(params[:circuit].to_i))
    redirect_to workout_path(@w)
  end

  def show
  end

  def index
    @workouts = Workout.where(user_id: current_user.id).order(created_at: :desc)
    @calories = @workouts.map {|w| w.calories }.reject {|c| c.nil? }.reduce(:+)
  end

  private

  def set_workout
    @workout = Workout.find(params[:id])
  end
end
