class RequestsController < ApplicationController
  before_action :set_plante, only: %i[new create]

  def index
    @requests = current_user.requests
  end

  # def show
  # end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(user: current_user, plante: @plante)
    if @request.save
      redirect_to requests_path
    else
      flash.now[:alert] = 'you have already made a request'
      render 'plantes/show', status: 422
    end
  end

  private

  def set_plante
    @plante = Plante.find(params[:plante_id])
  end
end
