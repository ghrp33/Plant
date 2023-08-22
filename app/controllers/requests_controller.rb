class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end

  def new
  end

  def create
  end

  def show
    @request = @plant.requests.find(params[:id])
  end

  def update
  end
end
