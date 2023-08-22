class PlantesController < ApplicationController
  def index
    @plantes = Plante.all
  end

  def show
    @plante = Plante.find(params[:id])
    @requests = @plante.requests
  end

  def new
  end

  def create
  end
end
