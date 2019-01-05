class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :update]

  def create
    @workout = Workout.create!(length: params[:workout][:length].to_i * 60, calories: 0, interval: 30, user: current_user, circuit: Circuit.find(params[:circuit].to_i))
    redirect_to circuit_workout_path(@workout.circuit, workout: @workout)
  end

  def show
  end

  def index
    @workouts = Workout.where(user_id: current_user.id).order(created_at: :desc)
    @calories = @workouts.map {|w| w.calories }.reject {|c| c.nil? }.reduce(:+)
  end

  def update
    @workout.calories = rand(300)
    @workout.save!
    redirect_to workout_path(@workout)
  end

  private

  def set_workout
    @workout = Workout.find(params[:id])
  end

end
