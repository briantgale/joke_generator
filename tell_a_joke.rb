require 'rest-client'
require 'json'

puts "Pick your joke type:"
puts "1. Dad Joke"
puts "2. Trump Quote"
puts "3. Chuck Norris"
puts "4. Programmer Joke"
puts "Any other value will return a random joke."

response = gets.chomp

case response.to_i
when 1
  response = RestClient.get("https://icanhazdadjoke.com/", {accept: :json})
  puts JSON.parse(response.body)["joke"]
when 2
  response = RestClient.get("https://www.tronalddump.io/random/quote")
  puts JSON.parse(response.body)["value"]
when 3
  response = RestClient.get("https://api.chucknorris.io/jokes/random")
  puts JSON.parse(response.body)["value"]
when 4
  response = RestClient.get("https://sv443.net/jokeapi/category/Programming")
  body = JSON.parse(response.body)
  if body["type"] == "single"
    puts body["joke"]
  elsif body["type"] == "twopart"
    puts body.slice("setup", "delivery").values.join(" ")
  end
else
  joke_types = %w(dad trump norris jokeapi)
  joke_to_tell = joke_types.sample

  if joke_to_tell == "dad"
    response = RestClient.get("https://icanhazdadjoke.com/", {accept: :json})
    puts JSON.parse(response.body)["joke"]
  elsif joke_to_tell == "trump"
    response = RestClient.get("https://www.tronalddump.io/random/quote")
    puts JSON.parse(response.body)["value"]
  elsif joke_to_tell == "norris"
    response = RestClient.get("https://api.chucknorris.io/jokes/random")
    puts JSON.parse(response.body)["value"]
  elsif joke_to_tell == "jokeapi"
    response = RestClient.get("https://sv443.net/jokeapi/category/Programming")
    body = JSON.parse(response.body)
    if body["type"] == "single"
      puts body["joke"]
    elsif body["type"] == "twopart"
      puts body.slice("setup", "delivery").values.join(" ")
    end
  end
end
