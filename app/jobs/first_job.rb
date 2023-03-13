class FirstJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "hello"
    # Do something later
  end
end
