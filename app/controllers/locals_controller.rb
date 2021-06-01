class LocalsController < ApplicationController

  def index
    @locals = Local.all
  end

  def show
    @local = Local.find(params[:id])
  end

  def new
    @local = Local.new
  end

  def create
    @local = Local.new(local_params)
    @local.user = current_user
    if @local.save
      redirect_to @local
    else 
      render :new
    end
  end
  
  def edit
    @local = Local.find(params[:id])
  end
  
  def update
    @local = Local.find(params[:id])
    if @local.update(local_params)
      redirect_to @local, notice: "Successfully Updated"
    else
      render :edit
    end
  end
  
  def destroy
    @local = Local.find(params[:id])
    @local.destroy
    redirect_to locals_path, notice: "Successfully Deleted"
  end

  private

  def local_params
    params.require(:local).permit(:name, :city, :descritpion, :price)
  end  
end
