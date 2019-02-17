class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
  end

  def create

  end

  def new
    # here will be a method for a new job
  end

  def edit
  end
end
