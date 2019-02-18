class BookingsController < ApplicationController
def index
  @bookings = Booking.all
end

def show
  
end

def new
end

def create
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
def booking_params
    params.require(:booking).permit(:status)
end
end 