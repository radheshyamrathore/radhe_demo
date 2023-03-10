class ArticleMailer < ApplicationMailer
	default from: 'notifications@example.com'

	def welcome_article(article,current_user)
    @current_user = current_user
    @article = article

    mail(
      to: @current_user[:email], 
      subject: 'Welcome to My Awesome Site'
      )
  end
end
