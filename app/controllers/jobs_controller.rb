class JobsController < ApplicationController

  def create

    @job = Job.new(job_params)

    if @job.save 
      render 'jobs/create'
    end

  end
 
  def index
    @jobs = Job.all
    render 'jobs/index'
  end

  def show
    @job = Job.find_by(id: params[:id])

    if @job 
      render 'jobs/show'
    else
      render 'jobs/error'
    end
  end
 
  def job_params
    params.require(:job).permit(:job_title)
  end

  private
end
