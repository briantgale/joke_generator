class JokeGenerator::TrumpJoke

  def joke
    response = RestClient.get("https://www.tronalddump.io/random/quote")
    JSON.parse(response.body)["value"]
  end

end
