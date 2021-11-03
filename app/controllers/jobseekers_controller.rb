class JobseekersController < ApplicationController
  def index
    if params[:query].present?
      @jobseekers = policy_scope(Jobseeker).search_by_trade_and_last_name_and_address_line3_and_post_code(params[:query])
    else
      @jobseekers = policy_scope(Jobseeker).order(created_at: :desc)
    end
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
    authorize @jobseeker

    respond_to do |format|
      if @jobseeker.save
        JobseekerMailer.with(jobseeker: @jobseeker).register_jobseeker.deliver_later
        format.html { redirect_to(@jobseeker, notice: "Jobseeker was sucessfully created.") }
        format.json { render json: @jobseeker, status: :created, location: @jobseeker }
      else
        format.html { render action: 'new' }
        format.json { render json: @jobseeker.errors, status: :unprocessable_entity }
      end
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
    params.require(:jobseeker).permit(:first_name, :last_name, :address_line1, :address_line2, :address_line3, :post_code, :phone_number, :email, :trade, :qualifications, :references, :enquiry)
  end
end
