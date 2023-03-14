class UserMailer < ApplicationMailer
	default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    mail(
      to: @user[:email], 
      subject: 'Welcome to My Awesome Site'
      )
  end

  def confirmation_instructions(user, token, opts={})
    @token = token
    devise_mail(user, :confirmation_instructions, opts)
  end
end
