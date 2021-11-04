class JobseekerMailer < ApplicationMailer
  default from: 'notifications@greenstar.co.uk'

  def register_jobseeker
    @jobseeker = jobseeker_params
    mail(to: "olka.kolesova@gmail.com", subject: "New jobseeker registered")
  end
end
