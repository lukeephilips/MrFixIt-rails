class JobsController < ApplicationController
before_action :authenticate_user!, only: [:new, :create]
before_action :authenticate_worker!, only: [:update]
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
   @job = Job.new
   render :new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:notice] = "You added a job"
      redirect_to jobs_path
    else
      flash[:alert] = @job.errors.full_messages.each {|m| m.to_s}.join
      render :new
    end
  end

  def edit
   @job = Job.find(params[:id])
   render :edit
  end

  def update
    @job = Job.find(params[:id])
      if current_worker
        if @job.update(job_params)
          respond_to do |format|
            format.js
            format.html { redirect_to worker_path(current_worker) }
          end
        else
          render :show
          flash[:notice] = "Something went wrong!"
        end
      end
  end

private

  def job_params
    params.require(:job).permit(:title, :description, :user_id, :worker_id, :pending, :completed, :in_progress)
  end

end
