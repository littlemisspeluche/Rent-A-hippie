class BookingsController < ApplicationController
def index
  @bookings = Booking.all
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


def edit
  @booking = Booking.find(params[:id]) 
end

def update
  @booking = Booking.find(params[:id]) 
  if @booking.update(booking_params)
      redirect_to bookings_path(@booking)
    else
      puts "hello"
  end
end



  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :user_id, :job_id)
  end
end



