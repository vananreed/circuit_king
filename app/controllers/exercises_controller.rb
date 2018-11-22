require 'open-uri'
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

  def search_ace
    url = 'https://www.acefitness.org/education-and-resources/lifestyle/exercise-library/body-part/'
    url += params['body-part'] if params['body-part']
    @categories = Nokogiri::HTML(open(url)).css('.widget__link-list-title').text.strip.gsub(' ', '').gsub('/', '-').split.uniq
    ###need to add hyphens to some of the category names to create correct url when requested
    @cards = Nokogiri::HTML(open(url)).css('.exercise-card-grid__cell')     #.inner_html
    @exercises = @cards.map do |card|
      {
        name: card.css('.exercise-card__title').text,
        description: card.css('.exercise-info__term--body-part').text.gsub(/(\r\n\t)/, ''),
        image: card.css('.exercise-card__image').attribute('style').value[22..89], #need to fix this for all image links
        difficulty: card.css('.exercise-info__lvl-label').text
      }
    end
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
