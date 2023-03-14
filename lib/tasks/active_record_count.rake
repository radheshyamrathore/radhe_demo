namespace :active_record_count do
  desc "Users count"
  task users_count: :environment do
    puts "Users count = #{User.count}"
  end

  desc "articles count"
  task articles_count: :environment do
    puts "Articles count = #{Article.count}"
    articles = Article.all
    articles.each do |article|
      puts "#{article.id} - #{article.title}"
    end
  end

  desc "find comments"
  task comments_find: :environment do
   p comment = Comment.find(97)
   puts "comments count = #{Comment.count}"
  end

end
