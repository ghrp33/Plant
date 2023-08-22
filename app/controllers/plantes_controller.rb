class PlantesController < ApplicationController
  def index
    @plantes = Plante.all
  end

  def show
  end

  def new
  end

  def create
  end
end
