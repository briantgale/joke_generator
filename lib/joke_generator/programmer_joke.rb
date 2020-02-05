class JokeGenerator::ProgrammerJoke < JokeGenerator::JokeService
  API_PATH = "https://sv443.net/jokeapi/category/Programming"

  private

  def extract_joke(json)
    # This API returns 2 types of response, a general joke and a setup/punchline joke
    case json["type"]
    when "single"
      json["joke"]
    when "twopart"
      json.slice("setup", "delivery").values.join(" ")
    end
  end

end
