class ListingsController < ApplicationController

  skip_before_action :authenticate_user!, only: :index

  def index
    @listings = Listing.geocoded

    @markers = @listings.map do |listing|
      {
        lat: listing.latitude,
        lng: listing.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {listing: listing}),
        marker_html: render_to_string(partial: "marker")
      }
    end

    if params[:location].present?
      @listings = @listings.global_search(params[:location])
    end

    if params[:check_in].present? && params[:check_out].present?
      @listings = @listings.left_joins(:bookings).where.not(
    bookings: { start_date: params[:check_in]..params[:check_out] }
      ).or(
      @listings.left_joins(:bookings).where(bookings: { id: nil })
      )
    end

if params[:guests].present?
  @listings = @listings.where("number_guests >= ?", params[:guests].to_i)
end

  end

  def show
    @listing = Listing.find(params[:id])
    @booking = Booking.new
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    if @listing.save
      redirect_to listings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listings_path
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :location, :description, :price, :number_guests, :photo, :address)
  end
end
