class UserMailer < ApplicationMailer

  def rejection_email(project, reasons)
    @project = project
    @reasons = reasons
    mail(to: @project.user.email, subject: "#{@project.title} postulation has been rejected")
  end

  def pending_for_review_email(project)
    @project = project
    mail(to: @project.user.email, subject: "#{@project.title} postulation has been updated")
  end

end
