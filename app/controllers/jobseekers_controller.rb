class JobseekersController < ApplicationController
  def index
    @jobseekers = policy_scope(Jobseeker).order(created_at: :desc)
  end

  def new
    @user = current_user
    if @user.jobseeker.present?
      @jobseeker = Jobseeker.find(@user.jobseeker.id)
    else
      @jobseeker = Jobseeker.new
    end
    authorize @jobseeker
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
    @user = current_user
    @jobseeker = Jobseeker.find(@user.jobseeker.id)
    authorize @jobseeker
    if @jobseeker.update(jobseeker_params)
      redirect_to new_jobseeker_path
    else
      render "jobseekers/new"
    end
  end

  def destroy
    @jobseeker = Jobseeker.find(params[:id])
    @jobseeker.destroy
  end

  def jobseeker_params
    params.require(:jobseeker).permit(:first_name, :last_name, :address_line1, :address_line2, :post_code, :phone_number, :email, :trade, :qualifications, :references, :enquiry)
  end
end
