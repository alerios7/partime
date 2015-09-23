class JobsController < ApplicationController
  before_action :authenticate_employer!, only: [:new, :create, :edit, :update, :destroy]

  def show
    @store = Store.find(params[:store_id])
    @job = @store.jobs.find(params[:id])
  end

  def create
    @store = Store.find(params[:store_id])
    @job = @store.jobs.new(job_params)
    @job.employer_id = current_employer.id
    if @job.save
      redirect_to store_path(@store)
    else
      @jobs = @store.jobs
      render 'stores/show'
    end
  end

  def destroy
    @store = Store.find(params[:store_id])
    @job = @store.jobs.find(params[:id])
    if @job.destroy
      redirect_to store_path(@store), notice: "Se ha eliminado correctamente"
    else
      redirect_to store_path(@store), notice: "No se ha podido eliminar"
    end
  end

  def edit
    @store = Store.find(params[:store_id])
    @job = @store.jobs.find(params[:id])
  end

  def update
    @store = Store.find(params[:store_id])
    @job = @store.jobs.find(params[:id])
    if @job.update(job_params)
      redirect_to store_job_path(@store, @job), notice: "Se actualizo la información"
    else
      render :edit
    end
  end

  private
    def job_params
      params.require(:job).permit(:title, :body, :start_date, :finish_date)
    end

end
