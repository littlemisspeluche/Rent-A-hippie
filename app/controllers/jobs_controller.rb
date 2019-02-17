class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])

  end

  def create
  end

  def new
  end

  def edit
  end
end
