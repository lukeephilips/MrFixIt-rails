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
          flash[:notice] = "You updated #{@job.title}."
          respond_to do |format|
            format.html { redirect_to :back}
            format.js
          end
        # elsif @job.update(pending: true, worker_id: current_worker.id)
        #   flash[:notice] = "You claimed #{@job.title}."
        #   respond_to do |format|
        #     # format.html { redirect_to job_path(@job)}
        #     format.js
        #   end
        else
          render :show
          flash[:notice] = "Something went wrong!"
        end
      # else
      #   # We need to streamline this process better in the future! - Mr. Fix-It.
      #   flash[:notice] = 'You must have a worker account to claim a job. Register for one using the link in the navbar above.'
      #   redirect_to job_path(@job)
      end
    # end
  end

private

  def job_params
    params.require(:job).permit(:title, :description, :user_id, :worker_id, :pending, :completed, :in_progress)
  end

end
