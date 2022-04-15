class BookingsController < ApplicationController

  def index
    @booking = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @flat = Flat.find(params[:flat_id])   
    @booking = Booking.new()
  end

  def create
    @flat = Flat.find(params[:flat_id])   
    @booking = Booking.new(booking_params)  
    @booking.user_id = current_user
    @booking.flat_id = @flat
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
    @booking.update(booking_params)    
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :edit
    end   
  end

  private
  
  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :total_price, :number_of_nights)
  end
end
