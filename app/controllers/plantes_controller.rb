class PlantesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @plantes = Plante.all
  end

  def show
    @plante = Plante.find(params[:id])
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

  def myplants
    @myplants = Plante.where(user: current_user)
  end

  private

  def plante_params
    params.require(:plante).permit(:name, :price, :variety, :description, :image)
  end
end
