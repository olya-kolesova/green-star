class JobseekersController < ApplicationController
  def index
    @jobseeker = Jobseeker.all
  end

  def create
    @jobseeker = Project.new(project_params)
    if @jobseeker.save
      redirect_to jobseekers_path
    else
      render "index"
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
    params.require(:jobseeker).permit[:first_name, :last_name, :address_line1, :address_line2, :post_code, :phone_number, :email, :trade, :qualifications, :references, :enquiry]
  end
end
