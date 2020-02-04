class JokeGenerator::ProgrammerJoke

  def joke
    response = RestClient.get("https://sv443.net/jokeapi/category/Programming")
    body = JSON.parse(response.body)
    parse_joke(body)
  end

  private

  def parse_joke(api_response)
    # This API returns 2 types of response, a general joke and a setup/punchline joke
    case api_response["type"]
    when "single"
      api_response["joke"]
    when "twopart"
      api_response.slice("setup", "delivery").values.join(" ")
    end
  end

end
