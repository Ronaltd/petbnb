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
    @booking = Booking.new
    @booking.local = @local
    @booking.user = current_user
    if @booking.save
      # PROCURAR SOBRE AVAILABILITY
      redirect_to booking_path(@booking.local)
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

end
