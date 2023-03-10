class ConfirmationEmailJob < ApplicationJob
  queue_as :default

  def perform(user)
    byebug
    UserMailer.welcome_email(user)
  end
end
