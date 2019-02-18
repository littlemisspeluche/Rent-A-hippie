class BookingsController < ApplicationController
def index
  @bookings = policy_scope(Booking)
end

def show
  @booking = Booking.find(params[:id])
  authorize @booking

end

  def new
    @job = Job.find(params[:job_id])
    @booking = Booking.new
    authorize @booking

  end

  def create
    @job = Job.find(params[:job_id])
    @booking = Booking.new(booking_params)
    @booking.job = @job
    @booking.user = current_user
    authorize @booking
    if @booking.save
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
  @booking = Booking.find(params[:id])

  authorize @booking
  @booking.status == "0" ? @booking.status = "Pending" : @booking.status = "Approved"
  @booking.save
  if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      puts "hello"
  end
end



  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :job_id)
  end
end



