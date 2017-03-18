class UserMailer < ApplicationMailer

  def signup(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to ShutterUp!')
  end

  def forgot_password(user)
    @user = user
    @greeting = "Greetings,"

    mail to: user.email, :subject => 'Reset password instructions'
  end

end
