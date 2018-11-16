require 'rspotify'
class CircuitsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:workout, :show, :index]
  before_action :set_circuit, only: [:edit, :update, :show, :destroy]

  def workout
    @circuit = Circuit.find(params[:circuit_id])
    RSpotify.authenticate("#{ENV['SPOTIFYCLIENTID']}", "#{ENV['SPOTIFYCLIENTSECRET']}")
    @playlist = RSpotify::Playlist.search('workout').sample
  end

  def new
  end

  def create
    @exercise_ids = params['circuit']['exercises'].select { |exercise| exercise != '' }.map { |exercise| exercise.to_i }
    @exercises = @exercise_ids.map { |id| Exercise.find(id)}
    @circuit = Circuit.new(circuit_params)
    @circuit.exercises = @exercises
    if @circuit.save!
      redirect_to circuit_workout_path(@circuit)
    else
      redirect_to root_path
    end
  end

  def show
  end

  def index
    @circuits = Circuit.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_circuit
    @circuit = Circuit.find(params[:id])
  end

  def circuit_params
    params.require(:circuit).permit(:name, :exercises)
  end
end
