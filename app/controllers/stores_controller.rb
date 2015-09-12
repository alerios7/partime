class StoresController < ApplicationController
  before_action :authenticate_employer!, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @stores = Store.find_by(company_id: current_employer.company_id)
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

  def store_params
    params.require(:store).permit(:name, :email, :address)
  end

end
