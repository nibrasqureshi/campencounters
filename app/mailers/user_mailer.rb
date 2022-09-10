# frozen_string_literal:true

#user mailer 
class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome Camp Encounters Site')
  end
end
