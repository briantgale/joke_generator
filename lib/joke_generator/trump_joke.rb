class JokeGenerator::TrumpJoke < JokeGenerator::JokeService
  API_PATH = "https://www.tronalddump.io/random/quote"
  JSON_LOCATION = ["value"]
end
