class JobseekersController < ApplicationController
  def index
    @jobseeker = Jobseeker.all
  end

  def new
    if current_user.jobseeker.present?
      @jobseeker = Jobseeker.new(jobseeker_params)
    else
      @jobseeker = Jobseeker.new
    end
  end

  def create
    @jobseeker = Jobseeker.new(jobseeker_params)
    @jobseeker.user = current_user
    if @jobseeker.save
      redirect_to new_jobseeker_path
    else
      render "jobseekers/new"
    end
  end

  def update
    @jobseeker = jobseeker.find(params[:id])
    @jobseeker.update(jobseeker_params)
  end

  def destroy
    @jobseeker = jobseeker.find(params[:id])
    @jobseeker.destroy
  end

  def jobseeker_params
    params.require(:jobseeker).permit(:first_name, :last_name, :address_line1, :address_line2, :post_code, :phone_number, :email, :trade, :qualifications, :references, :enquiry)
  end
end
