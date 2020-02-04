class JokeGenerator::NorrisJoke

  def joke
    response = RestClient.get("https://api.chucknorris.io/jokes/random")
    JSON.parse(response.body)["value"]
  end

end

