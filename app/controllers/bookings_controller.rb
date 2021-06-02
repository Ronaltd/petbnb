class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @local = Local.find(params[:local_id])
    @booking = Booking.new
  end
  
  def create
    @local = Local.find(params[:local_id])
    @booking = Booking.new(booking_params)
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
        render :new, notice: "Esta data já está reservada!!"
      end
    else
      render :new, notice: "Esta data já está reservada!!"
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @local = @booking.local
    bookings = @local.bookings
    temp_booking = Booking.new(booking_params)
    overlap = bookings.any? do |booking|
      (booking.checkin_date..booking.checkout_date).overlaps?(temp_booking.checkin_date..temp_booking.checkout_date)
    end
    if !overlap
      if @booking.update(booking_params)
        redirect_to booking_path(@booking), notice: "Successfully Updated"
      else
        render :edit, notice: "Esta data já está reservada!!"
      end
    else
      render :edit, notice: "Esta data já está reservada!!"
    end

  end

  def destroy
    @booking = Booking.find(params[:id])
    @local = @booking.local
    @booking.destroy
    redirect_to locals_path(@local), notice: "Successfully Deleted"
  end

  private

  def booking_params
    params.require(:booking).permit(:checkin_date, :checkout_date, :pet_name, :pet_type, :pet_weight)
  end
  

end
