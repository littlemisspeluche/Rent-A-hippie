class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      redirect_to job_path(@job)
    else
      render :new
    end
  end


  def edit
  end

  private
  def job_params
    params.require(:job).permit(:description, :location, :cost, :time)
  end
end
