class LocalsController < ApplicationController
  before_action :set_local, only: [:show, :edit, :update, :destroy]

  def index
    # object collection use policy_scope
    @locals = policy_scope(Local)
  end

  def show
  end

  def new
    @local = Local.new
    authorize @local
  end

  def create
    @local = Local.new(local_params)
    @local.user = current_user
    authorize @local
    if @local.save
      redirect_to @local
    else 
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @local.update(local_params)
      redirect_to @local, notice: "Successfully Updated"
    else
      render :edit
    end
  end
  
  def destroy
    @local.destroy
    redirect_to locals_path, notice: "Successfully Deleted"
  end

  private

  def set_local
    @local = Local.find(params[:id])
    authorize @local
  end

  def local_params
    params.require(:local).permit(:name, :city, :description, :price)
  end  
end
