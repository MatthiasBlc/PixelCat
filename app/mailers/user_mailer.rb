class UserMailer < ApplicationMailer
  default from: 'pixelcathp@gmail.com'

  def welcome_email(user)
    @user = user
    @url = 'https://pixel-cat-staging.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome subject')
  end
end
