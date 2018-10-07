class ExercisesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_exercise, only: [:edit, :update, :destroy, :show]

  def index
  end

  def show
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.create(exercise_params)
    redirect_to root_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:name, :description, :difficulty)
  end
end
