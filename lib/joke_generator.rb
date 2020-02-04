require "joke_generator/version"
require "joke_generator/dad_joke"
require "joke_generator/trump_joke"
require "joke_generator/norris_joke"
require "joke_generator/programmer_joke"
require 'rest-client'
require 'pry'

module JokeGenerator
  class Error < StandardError; end

  def self.joke
    puts "Pick your joke type:"
    puts "1. Dad Joke"
    puts "2. Trump Quote"
    puts "3. Chuck Norris"
    puts "4. Programmer Joke"

    response = gets.chomp

    case response.to_i
    when 1
      puts JokeGenerator::DadJoke.new.joke
    when 2
      puts JokeGenerator::TrumpJoke.new.joke
    when 3
      puts JokeGenerator::NorrisJoke.new.joke
    when 4
      puts JokeGenerator::ProgrammerJoke.new.joke
    else
      random
    end
  end
  
end
