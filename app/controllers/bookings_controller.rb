class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
  end

  def new
    @booking = Booking.new
    @listing = Listing.find(params[:listing_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @listing = Listing.find(params[:listing_id])
    @booking.user = current_user
    @booking.listing = @listing

    if @booking.save
      redirect_to bookings_path
    else
      render :new, listing: @listing, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
