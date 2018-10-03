class CircuitsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:workout, :show, :index]

  def workout
  end

  def new
  end

  def create
  end

  def show
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
