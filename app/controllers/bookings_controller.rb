class BookingsController < ApplicationController
def index
  @bookings = policy_scope(Booking)
end

def show
  @booking = Booking.find(params[:id])
  
  @job = Job.find(@booking.job_id)

    @markers = [{
        lng: @job.longitude,
        lat: @job.latitude
      }]
  authorize @booking

end

  def new
    @job = Job.find(params[:job_id])
    @booking = Booking.new
    authorize @booking
  end

  def create

    @job = Job.find(params[:job_id])
    @booking = Booking.new(user_id: current_user.id, job_id: params[:job_id])
    authorize @booking
    @job.booked = true
    if @booking.save && @job.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end


def edit
  @booking = Booking.find(params[:id])
  authorize @booking
end

def update
  job = Booking.find(params[:id])
  @booking = Booking.find(params[:id])
  authorize @booking
  @booking.status == "0" ? @booking.status = "Pending" : @booking.status = "Approved"
   if @booking.status == "Approved"
    current_user.confirmed = false
    @booking.job.user.confirmed = false
    @booking.user.confirmed = false
    current_user.save
    @booking.save
    job.save
  else
  current_user.confirmed = true
  end
  if @booking.update(user_id: current_user.id, job_id: job.job_id) && @booking.save && current_user.save
    redirect_to booking_path(@booking)
  else
    render :new
  end
end

  def mybookings

    @bookings = Booking.where(user_id: current_user.id)
    authorize @bookings
  end



  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :job_id)
  end
end



