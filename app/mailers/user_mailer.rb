class UserMailer < ApplicationMailer
  default from: 'pixelcathp@gmail.com'

  def welcome_email(user)
    @user = user
    @url = 'https://pixel-cat.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome subject')
  end

  def confirmation_email(order)
    @user = order.user
    @url = 'https://pixel-cat.herokuapp.com/'
    mail(to: @user.email, subject: 'Your order')
  end

  def confirmation_admin_email(order)
    @order = order
    @user = order.user
    @url = 'https://pixel-cat.herokuapp.com/'
    @amout = order.total_price
    mail(to: 'adminpixcat@yopmail.com', subject: 'new order')
  end
end
