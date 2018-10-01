class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:edit, :update, :destroy, :show]

  def index
  end

  def show
  end

  def new
  end

  def create
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
end
