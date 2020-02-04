class JokeGenerator::DadJoke

  def joke
    response = RestClient.get("https://icanhazdadjoke.com/", {accept: :json})
    JSON.parse(response.body)["joke"]
  end

end
