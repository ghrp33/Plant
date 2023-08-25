class RequestsController < ApplicationController
  before_action :set_plante, only: %i[new create]

  def index
    @requests = current_user.requests
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(user: current_user, plante: @plante)
    if @request.save
      redirect_to requests_path
    else
      flash.now[:alert] = 'You have already made a request'
      render 'plantes/show', status: 422
    end
  end

  def accept
    @request = Request.find(params[:id])
    @request.status = true
    if @request.save
      redirect_to requests_path
    else
      flash.now[:alert] = 'No longer available'
      render 'plantes/show', status: 422
    end
  end

  def reject
    @request = Request.find(params[:id])
    @request.status = false
    if @request.save
      redirect_to requests_path
    else
      flash.now[:alert] = 'No longer available'
      render 'plantes/show', status: 422
    end
  end

  def cancel
    @request = Request.find(params[:id])
    @request.delete
    redirect_to requests_path
  end

  private

  def set_plante
    @plante = Plante.find(params[:plante_id])
  end
end
