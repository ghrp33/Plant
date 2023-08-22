class PlantesController < ApplicationController
  def index
    @plantes = Plante.all
  end

  def show
    @plante = Plante.find(params[:id])
  end

  def new
  end

  def create
  end
end
