require "joke_generator/version"
require 'rest-client'
require 'pry'

module JokeGenerator
  class Error < StandardError; end

  def self.start
    puts "Pick your joke type:"
    puts "1. Dad Joke"
    puts "2. Trump Quote"
    puts "3. Chuck Norris"
    puts "4. Programmer Joke"
    puts "Any other value will return a random joke."

    response = gets.chomp

    case response.to_i
    when 1
      puts get_dad_joke
    when 2
      puts get_trump_joke
    when 3
      puts get_norris_joke
    when 4
      puts get_jokeapi_joke
    else
      random
    end
  end
  
  def self.random
    joke_service = pick_joke_service
    joke_method = ["get", joke_service, "joke"].join("_").to_sym
    puts "Retrieving a #{joke_service} joke:"
    puts send(joke_method)
  end

  private

  def self.pick_joke_service
    joke_types = %w(dad trump norris jokeapi)
    joke_types.sample
  end

  def self.get_dad_joke
    response = RestClient.get("https://icanhazdadjoke.com/", {accept: :json})
    JSON.parse(response.body)["joke"]
  end

  def self.get_trump_joke
    response = RestClient.get("https://www.tronalddump.io/random/quote")
    JSON.parse(response.body)["value"]
  end

  def self.get_norris_joke
    response = RestClient.get("https://api.chucknorris.io/jokes/random")
    JSON.parse(response.body)["value"]
  end

  def self.get_jokeapi_joke
    response = RestClient.get("https://sv443.net/jokeapi/category/Programming")
    body = JSON.parse(response.body)
    parse_jokeapi_joke(body)
  end

  def self.parse_jokeapi_joke(api_response)
    # This API returns 2 types of response, a general joke and a setup/punchline joke
    case api_response["type"]
    when "single"
      api_response["joke"]
    when "twopart"
      api_response.slice("setup", "delivery").values.join(" ")
    end
  end
end
