class PlantesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @plantes = Plante.all
    @plantes = @plantes.search_by_variety(params[:variety]) if params[:variety].present?
    if params[:query].present?
      @plantes = Plante.search_by_name_and_variety_and_description(params[:query])
    end
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

  def destroy
    @myplants = Plante.where(user: current_user)
    @myplants = @myplants.find(params[:id])
    @myplants.destroy

    redirect_to myplants_path, status: :see_other
  end

  private

  def plante_params
    params.require(:plante).permit(:name, :price, :variety, :description, :image)
  end
end
