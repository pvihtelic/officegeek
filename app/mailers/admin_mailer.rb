class AdminMailer < ActionMailer::Base

  require 'open-uri'

  default from: "sales@officescholar.com"

  def admin_upload_notification_email(quiz, current_user)
    @url  = "http://officescholar.com"
    @quiz = quiz
    @user = current_user
    mail(to: "pat@officescholar.com", :subject => "New Upload From #{@user.email}")
    attachments["#{quiz.quiz_path_file_name}"] = open("#{quiz.quiz_path.expiring_url(60)}").read
  end

  def admin_update_quiz_notification_email(quiz, current_user)
	@url  = "http://officescholar.com"
    @quiz = quiz
    @user = current_user
    mail(to: "pat@officescholar.com", :subject => "Updated Quiz from #{@user.email}")
    attachments["#{quiz.quiz_path_file_name}"] = open("#{quiz.quiz_path.expiring_url(60)}").read
  end  	

end