class JobsController < ApplicationController
  before_action :authenticate_employer!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @store = Store.find(params[:store_id])
    @jobs = @store.jobs.all
  end

  def new
    @store = Store.find(params[:store_id])
    @job = @store.jobs.new
  end

  def create
    @store = Store.find(params[:store_id])
    @job = @store.jobs.new(job_params)
    @job.employer_id = current_employer.id
    if @job.save
      redirect_to store_jobs_path(@store)
    else
      render :new
    end
  end

  private
    def job_params
      params.require(:job).permit(:title, :body, :start_date, :finish_date)
    end

end
