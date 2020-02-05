class JokeGenerator::DadJoke < JokeGenerator::JokeService
  API_PATH = "https://icanhazdadjoke.com/"
  JSON_LOCATION = ["joke"]
end
