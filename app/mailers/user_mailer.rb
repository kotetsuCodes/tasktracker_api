class UserMailer < ActionMailer::Base
  default :from => 'taskTracker@ketsoh.tk'

  def registration_confirmation(user)
    @user = user
    mail(:to => "<#{user.email}>", :subject => 'Registration Confirmation for TaskTracker')
  end
end