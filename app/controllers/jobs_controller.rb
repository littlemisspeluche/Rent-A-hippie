class JobsController < ApplicationController
  def index
    @jobs = policy_scope(Job)
    @job = Job.where("booked = false")
  end

  def show
    @job = Job.find(params[:id])
    authorize @job
  end

  def new
    @job = Job.new
    authorize @job
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    authorize @job
    if @job.save
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  def destroy
    @job = Job.find(params[:id])
    authorize @job
    @job.destroy
    redirect_to jobs_path

  end

  def edit
   @job = Job.find(params[:id])
   authorize @job
  end

  def update
  @job = Job.find(params[:id])
  authorize @job
  @job.update(job_params)
  redirect_to job_path(@job)
  end

  def myjobs
  @jobs = Job.where(user_id: current_user.id)
  authorize @jobs
  end

  private

  def job_params
    params.require(:job).permit(:description, :location, :cost, :time)
  end

end


