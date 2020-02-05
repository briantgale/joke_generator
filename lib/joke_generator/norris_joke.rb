class JokeGenerator::NorrisJoke < JokeGenerator::JokeService
  API_PATH = "https://api.chucknorris.io/jokes/random"
  JSON_LOCATION = ["value"]
end

