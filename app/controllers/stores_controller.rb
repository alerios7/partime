class StoresController < ApplicationController
  before_action :authenticate_employer!, only: [:index, :new, :create, :edit, :update, :destroy]
  
  def index
    @stores = Store.instance_company(current_employer).page(params[:page])
  end

  def show
    @store = Store.find(params[:id])
  end

  def new
    @store = Store.new
  end

  def create
    @store = current_employer.stores.new(store_params)
    if @store.save
      redirect_to stores_path
    else
      render :new
    end
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])
    if @store.update(store_params)
      redirect_to store_path
    else
      render :edit
    end
  end

  def destroy
    @store = Store.find params[:id]
    @store.destroy
    flash[:success] = "Tienda Eliminada"
    redirect_to stores_path
  end

  def store_params
    params.require(:store).permit(:name, :email, :address, :manager_name, :manager_lastname, :phone)
  end

end
