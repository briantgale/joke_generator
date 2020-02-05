require "joke_generator/version"
require "joke_generator/joke_service"
require "joke_generator/dad_joke"
require "joke_generator/trump_joke"
require "joke_generator/norris_joke"
require "joke_generator/programmer_joke"
require 'rest-client'
require 'pry'

module JokeGenerator
  class Error < StandardError; end

  def self.joke(type:)
    type = type.to_sym if type.is_a?(String)

    raise "#{type} is not a valid joke type" unless JokeGenerator::JokeService::JOKE_TYPES.include?(type)

    klass = [type,"joke"].map(&:capitalize).join
    Object.const_get("JokeGenerator::#{klass}").new
  end

  def self.jokes(type:, count:)
    raise "#{type} is not a valid joke type" unless JokeGenerator::JokeService::JOKE_TYPES.include?(type)
    raise "count must be greater than 0" unless count > 0

    Array.new(count).map { joke(type: type) }
  end

  def self.tell_a_joke
    puts "Pick your joke type:"

    JokeGenerator::JokeService::JOKE_TYPES.each_with_index do |joke_type, i|
      puts "#{i + 1}. #{joke_type.capitalize} Joke"
    end

    print "Your choice: "
    response = gets.chomp

    print "How many jokes should I tell (1-10)? "
    count = gets.chomp

    count = count.to_i 
    count = 1 if count < 1 || count > 10

    joke_type = JokeGenerator::JokeService::JOKE_TYPES[response.to_i - 1]

    puts "\n"
    jokes(type: joke_type, count: count).each do |joke|
      puts joke.joke
      puts "\n"
    end
  end
end
