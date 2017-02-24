class JobsController < ApplicationController
before_action :authenticate_user!, only: [:new, :create, :update]
  def index
    @jobs = Job.all
  end

  def new
   @job = Job.new
   render :new
  end

  def show
    @job = Job.find(params[:id])
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

  def update
    @job = Job.find(params[:id])
    if current_worker
      if @job.update(pending: true, worker_id: current_worker.id)
        redirect_to worker_path(current_worker)
        flash[:notice] = "You've successfully claimed this job."
      else
        render :show
        flash[:notice] = "Something went wrong!"
      end
    else
      # We need to streamline this process better in the future! - Mr. Fix-It.
      flash[:notice] = 'You must have a worker account to claim a job. Register for one using the link in the navbar above.'
      redirect_to job_path(@job)
    end
  end

private

  def job_params
    params.require(:job).permit(:title, :description)
  end

end
