class JobsController < ApplicationController
  def index
    @jobs = policy_scope(Job)
    @jobb = @jobs.where("booked = false AND location = ? ", params["format"])
    @job = @jobs.last
    @markers = @jobs.map do |job|
      {

        lng: job.longitude,
        lat: job.latitude
      }
    end

  end

  def show
    @job = Job.find(params[:id])

    @markers = [{
        lng: @job.longitude,
        lat: @job.latitude
      }]

    authorize @job
  end

  def new
    @job = Job.new
    authorize @job
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    #results = Geocoder.search("")
    results = Geocoder.search("213.30.114.42")

    @job.location = results.first.city + " " +"Boom"
    @job.latitude = results.first.coordinates.first
    @job.longitude =  results.first.coordinates.last

    authorize @job
    if @job.save
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  def destroy
    @job = Job.find(params[:id])
    location = @job.location
    authorize @job
    @job.destroy
    redirect_to jobs_path(location)

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


