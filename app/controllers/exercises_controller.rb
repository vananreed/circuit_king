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
    base_url = 'https://www.acefitness.org/'
    index_url = base_url + 'education-and-resources/lifestyle/exercise-library/body-part/'
    index_url += params['body-part'] if params['body-part']
    @categories = Nokogiri::HTML(open(index_url)).css('.widget__link-list-title').text.strip.gsub(' ', '').gsub('/', '-').split.uniq
    ###need to add hyphens to some of the category names to create correct index_url when requested
    @cards = Nokogiri::HTML(open(index_url)).css('.exercise-card-grid__cell')
    @exercises = []
    @cards.each do |card|
      link = base_url + card.css('a').attr('href').value
      @exercises << {
        name: card.css('.exercise-card__title').text,
        short_desc: card.css('.exercise-info__term--body-part').text.gsub(/(\r\n\t)/, ''),
        image: card.css('.exercise-card__image').attribute('style').text.match(/.*url\('([^'\);]*)/)[1],
        difficulty: card.css('.exercise-info__lvl-label').text,
        link: link,
        long_desc: Nokogiri::HTML(open(link)).css('.exercise-post__step-content').text.gsub!(/Share:/, '')
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
