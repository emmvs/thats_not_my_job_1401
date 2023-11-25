class EmmasPoetryFetchJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "I'm starting the poetry job 👩🏼‍🏫"
    sleep 3

    # Fetch a random poem using the PoetryService
    poem = PoetryService.get_random_poem
    if poem
      puts "Here's a random poem: #{poem}"
    else
      puts "Sorry, couldn't find a poem this time. 🐝🐝"
    end

    puts "OK I'm done now ✍🏻 ✍🏻 ✍🏻"
  end
end
