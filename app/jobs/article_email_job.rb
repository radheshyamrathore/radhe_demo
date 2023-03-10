class ArticleEmailJob < ApplicationJob
  queue_as :default

  def perform(article, current_user)
    ArticleMailer.welcome_article(article,current_user).deliver_now
  end
end