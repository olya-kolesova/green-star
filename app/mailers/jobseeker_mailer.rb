class JobseekerMailer < ApplicationMailer
  default from: 'notifications@greenstar.co.uk'

  def register_jobseeker
    @jobseeker = params[:jobseeker]
    mail(to: "charles@greenstarrecruitment.co.uk", subject: "New jobseeker registered")
  end
end
