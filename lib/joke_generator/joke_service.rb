class JokeGenerator::JokeService
  attr_reader :joke

  def initialize
    @joke = get_joke
  end

  private

  def get_joke
    response = RestClient.get(self.class::API_PATH, {accept: :json})
    extract_joke(JSON.parse(response.body))
  end

  def extract_joke(json)
    json.dig(*self.class::JSON_LOCATION)
  end

end
