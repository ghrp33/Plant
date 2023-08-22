class PlantesController < ApplicationController
  def index
    @plantes = Plante.all
  end

  def show
    @plante = Plante.find(params[:id])
    @requests = @plante.requests
  end

  def new
    @plante = Plante.new
  end

  def create
    @plante = Plante.new(plante_params)
    @plante.user = current_user
    if @plante.save
      redirect_to plante_path(@plante)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def plante_params
    params.require(:plante).permit(:name, :price, :variety, :description, :image)
  end
end
