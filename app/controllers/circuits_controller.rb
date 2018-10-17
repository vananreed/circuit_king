
class CircuitsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:workout, :show, :index]
  before_action :set_circuit, only: [:edit, :update, :show, :destroy]

  def workout
    @circuit = Circuit.find(params[:circuit_id])
  end

  def new
  end

  def create
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
end
