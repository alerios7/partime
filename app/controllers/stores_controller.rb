class StoresController < ApplicationController
  before_action :authenticate_employer!, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @stores = Store.instance_company(current_employer).page(params[:page])
  end

  def show
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

  def destroy
    @store = Store.find params[:id]
    @store.destroy
    flash[:success] = "Micropost deleted"
    redirect_to stores_path
  end

  def store_params
    params.require(:store).permit(:name, :email, :address)
  end

end
