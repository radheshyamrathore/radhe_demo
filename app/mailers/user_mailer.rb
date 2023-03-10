class UserMailer < ApplicationMailer
	default from: 'notifications@example.com'
  byebug

  def welcome_email(user)
    @user = user
    mail(
      to: @user[:email], 
      subject: 'Welcome to My Awesome Site'
      )
  end

  # def confirmation_instructions(user)
  #   byebug
  #   @user = user
  #   mail(
  #     to: @user[:email], 
  #     subject: "confirm your account")
  # end
end
