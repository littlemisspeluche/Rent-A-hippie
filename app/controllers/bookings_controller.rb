class BookingsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @job = Job.find(params[:job_id])
    @booking = Booking.new

  end

  def create
    @job = Job.find(params[:job_id])
    @booking = Booking.new(booking_params)
    @booking.job = @job
    @booking.user = current_user

    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def update
  end

  def edit
  end


  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :user_id, :job_id)
  end
end


