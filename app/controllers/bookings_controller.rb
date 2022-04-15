class BookingsController < ApplicationController

  def index
    @booking = Booking.all
  end

  def show
    @booking     
  end
end
