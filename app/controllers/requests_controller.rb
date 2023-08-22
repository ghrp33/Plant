class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end

  def show
  end

  def new
  end
end
