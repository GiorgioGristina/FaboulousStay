class FlatsController < ApplicationController

  def index
    @flats = Flat.all
    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def show
    @flat = Flat.find(params[:id])
    @booking = Booking.new 
  end

  def new
    @flat = Flat.new

  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user_id = current_user.id
   
    if @flat.save
     redirect_to flat_path(@flat)
   else
     render :new
   end
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)   
    if @flat.save
     redirect_to flat_path(@flat)
    else
     render :edit
    end
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to flats_path
  end


  private

  def flat_params
    params.require(:flat).permit(:name, :description, :home_type, :number_of_bathrooms, :number_of_bedrooms, :wifi, :garden, :hot_tub, :parking, :kitchen, :tv, :aircon, :heating, :occupancy, :price_per_night, :address, :city, :country, :postcode)
  end
end
