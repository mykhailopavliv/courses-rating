class CourseMailer < ApplicationMailer
  def approved_email
    @course = params[:course]
    @url = root_url
    mail(to: @course.owner.email, subject: 'Project-X. Your course was successfully approved')
  end
end
