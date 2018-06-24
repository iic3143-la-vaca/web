class UserMailer < ApplicationMailer
  def rejection_email(project, reasons)
    @project = project
    @reasons = reasons
    mail(to: @project.user.email, subject: "#{@project.title} postulation has been rejected")
  end
end
