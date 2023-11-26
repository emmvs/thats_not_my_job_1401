# class EmmasPoetryFetchJob < ApplicationJob
#   queue_as :default

#   def perform(user)
#     puts "I'm starting the poetry job 👩🏼‍🏫"
#     sleep 3

#     # Fetch a random poem using the PoetryService
#     poem = PoetryService.get_random_poem
#     if poem
#       puts "Here's a random poem: #{poem}"
#     else
#       puts "Sorry, couldn't find a poem this time. 🐝🐝"
#     end

#     puts "OK I'm done now ✍🏻 ✍🏻 ✍🏻"
#   end
# end

class EmmasPoetryFetchJob < ApplicationJob
  queue_as :default

  def perform(user)
    puts "Starting the poetry job for #{user.name} 👩🏼‍🏫"
    sleep 3

    # Fetch a random poem using the PoetryService
    poem = PoetryService.get_random_poem_for_user(user)
    if poem
      puts "Here's a poem for #{user.name}: #{poem}"
    else
      puts "Sorry, couldn't find a poem for #{user.name} this time. 🐝🐝"
    end

    puts "All done with the poetry job for #{user.name} ✍🏻 ✍🏻 ✍🏻"
  end
end
