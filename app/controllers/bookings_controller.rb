class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  def show

  end

  def new
    @local = Local.find(params[:local_id])
    @booking = Booking.new
    authorize @booking
  end
  
  def create
    @local = Local.find(params[:local_id])
    @booking = Booking.new(booking_params)
    authorize @booking
    bookings = @local.bookings
    overlap = bookings.any? do |booking|
      (booking.checkin_date..booking.checkout_date).overlaps?(@booking.checkin_date..@booking.checkout_date)
    end
    if !overlap
      @booking.local = @local
      @booking.user = current_user

      if @booking.save
        redirect_to booking_path(@booking), notice: "Successfully Created"
      else
        render :new, notice: "Place already reserved for that day!"
      end
    else
      render :new, notice: "Place already reserved for that day!"
    end
  end

  def edit

  end

  def update
    @local = @booking.local
    bookings = @local.bookings
    temp_booking = Booking.new(booking_params)
    overlap = bookings.any? do |booking|
      (booking.checkin_date..booking.checkout_date).overlaps?(temp_booking.checkin_date..temp_booking.checkout_date)
    end

    if @booking.checkin_date == temp_booking.checkin_date && @booking.checkout_date == temp_booking.checkout_date
      @booking.update(booking_params)
      redirect_to booking_path(@booking), notice: "Successfully Updated"
    end

    if !overlap
      if @booking.update(booking_params)
        redirect_to booking_path(@booking), notice: "Successfully Updated"
      else
        flash[:notice] = "D"
        render :edit
      end
    end

  end

  def destroy
    @local = @booking.local
    @booking.destroy
    redirect_to locals_path(@local), notice: "Successfully Deleted"
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:checkin_date, :checkout_date, :pet_name, :pet_type, :pet_weight)
  end
  

end
