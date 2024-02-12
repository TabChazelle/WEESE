require 'google_search_results'
class OpenaiService

  HARD_CODED_PROMPT = "I'm going to give you a name of either a cheese or a wine. Your task is to respond in English with a single brand name that pairs well with the given input. If I give you the name of a cheese, you should respond with the name of a wine that pairs well with that cheese. If I give you the name of a wine, you should respond with the name of a cheese that pairs well with that wine. The response should be in the format of a JSON

  For the cheese, please include the following details:
  - Name
  - Softness
  - Country of origin
  - Region of origin
  - Type of milk used
  - A brief description

  For the wine, please include the following details:
  - Name
  - Family
  - Variety
  - Sweetness
  - Country of origin
  - Region of origin
  - Year of production
  - A brief description

  The JSON should be structured like this:

  {
    \"cheese\": {
      \"name\": \"\",
      \"softness\": \"\",
      \"country\": \"\",
      \"region\": \"\",
      \"milk\": \"\",
      \"description\": \"\",
    },
    \"wine\": {
      \"name\": \"\",
      \"family\": \"\",
      \"variety\": \"\",
      \"sweetness\": \"\",
      \"country\": \"\",
      \"region\": \"\",
      \"year\": \"\",
      \"description\": \"\",
    }
  }

  Thank you!

  My input is "

  def initialize(prompt)
    @prompt = prompt
  end

  def call
    full_prompt = "#{HARD_CODED_PROMPT} #{@prompt}"
    response = make_api_request(full_prompt)
    process_prompt(response)
  end

  private

  def make_api_request(full_prompt)
    client = OpenAI::Client.new
    begin
      puts "API request: #{full_prompt}" # This will log the full prompt in the server console
      response = client.chat(
        parameters: {
            model: "gpt-3.5-turbo",
            messages: [{ role: "user", content: full_prompt }],
            temperature: 0.7
        }
      )
      puts "API response: #{response}" # Print the entire response in the server console
    rescue Faraday::TooManyRequestsError
      sleep 1
      retry
    end
    response
  end

  require 'google_search_results'

  def process_prompt(response)
    if response['choices'] && response['choices'].first['message'] && response['choices'].first['message']['content']
      response_content = response['choices'].first['message']['content'].strip
      data = JSON.parse(response_content)
      cheese = Cheese.find_or_create_by(name: data['cheese']['name']) do |cheese|
        cheese.softness = data['cheese']['softness']
        cheese.country = data['cheese']['country']
        cheese.region = data['cheese']['region']
        cheese.milk = data['cheese']['milk']
        cheese.description = data['cheese']['description']
      end

      wine = Wine.find_or_create_by(name: data['wine']['name']) do |wine|
        wine.family = data['wine']['family']
        wine.variety = data['wine']['variety']
        wine.sweetness = data['wine']['sweetness']
        wine.country = data['wine']['country']
        wine.region = data['wine']['region']
        wine.year = data['wine']['year']
        wine.description = data['wine']['description']
      end

      # Creates a new pairing
      pairing = Pairing.create(wine_id: wine.id, cheese_id: cheese.id)

      # Search for images of the wine
      serpapi_params = {
        q: wine.name,
        tbm: 'isch',
        api_key: ENV.fetch('SERPAPI_API_KEY')
      }
      search = GoogleSearch.new(serpapi_params)
      results = search.get_hash
      wine_image_url = results['images_results'].first['link'] if results['images_results']

      # Assign the image URL to the wine object
      wine.image_url = wine_image_url
      wine.save

      # Search for images of the cheese
      serpapi_params[:q] = cheese.name
      search = GoogleSearch.new(serpapi_params)
      results = search.get_hash
      cheese_image_url = results['images_results'].first['link'] if results['images_results']

      # Assign the image URL to the cheese object
      cheese.image_url = cheese_image_url
      cheese.save

      formatted_response = "<strong>Cheese Details:</strong><br>" +
      "<strong>Name:</strong> #{cheese.name}<br>" +
      "<strong>Softness:</strong> #{cheese.softness}<br>" +
      "<strong>Country:</strong> #{cheese.country}<br>" +
      "<strong>Region:</strong> #{cheese.region}<br>" +
      "<strong>Milk:</strong> #{cheese.milk}<br>" +
      "<strong>Description:</strong> #{cheese.description}<br>" +

      "<strong>Wine Details:</strong><br>" +
      "<strong>Name:</strong> #{wine.name}<br>" +
      "<strong>Family:</strong> #{wine.family}<br>" +
      "<strong>Variety:</strong> #{wine.variety}<br>" +
      "<strong>Sweetness:</strong> #{wine.sweetness}<br>" +
      "<strong>Country:</strong> #{wine.country}<br>" +
      "<strong>Region:</strong> #{wine.region}<br>" +
      "<strong>Year:</strong> #{wine.year}<br>" +
      "<strong>Description:</strong> #{wine.description}<br>" +

      formatted_response.html_safe
    else
      "There has been an error processing the response please try again"
    end
  end
end



  # def process_prompt(response)
  #   puts "ENTERING PROCESS PROMPT"
  #   if response['choices'] && response['choices'].first['message'] && response['choices'].first['message']['content']
  #     response_content = response['choices'].first['message']['content'].strip
  #     puts "API response content: #{response_content}" # This will log the response content in the server console
  #     words = response_content.split
  #     last_word = words.pop.downcase
  #     response_content = words.join(' ')
  #     if last_word == 'cheese'
  #       # Save it to the cheese table
  #       Cheese.create(name: response_content)
  #     elsif last_word == 'wine'
  #       # Save it to the wines table
  #       Wine.create(name: response_content)
  #     else
  #       puts "The last word is neither 'cheese' nor 'wine'."
  #     end
  #   else
  #     "There has been an error processing the response please try again"
  #   end
  # end
