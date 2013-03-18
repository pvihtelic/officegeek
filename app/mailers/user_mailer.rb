class UserMailer < ActionMailer::Base
  default from: "pat@officescholar.com"

  def upload_notification_email(user)
    @user = user
    @url  = "http://officescholar.com"
    mail(to: user.email, subject: 'Your Skill Assessment is Being Reviewed by OfficeScholar')
  end

  def user_update_quiz_notification_email(user)
    @user = user
    @url  = "http://officescholar.com"
    mail(to: user.email, subject: 'OfficeScholar Received Your Updated Skill Assessment')
  end

end
