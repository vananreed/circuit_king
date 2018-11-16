class ExercisesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_exercise, only: [:edit, :update, :destroy, :show]

  def index
  end

  def show
    url = "https://www.googleapis.com/youtube/v3/search?q=#{@exercise.name}&maxResults=1&part=snippet%20&key=#{ENV['SERVERKEY']}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    res = JSON.parse(response)
    @id = res["items"][0]["id"]["videoId"]
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
