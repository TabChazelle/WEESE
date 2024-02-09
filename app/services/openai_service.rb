class OpenaiService

  HARD_CODED_PROMPT = "I'm going to give you a name of either a cheese or a wine. Your task is to respond in English with a single brand name that pairs well with the given input. If I give you the name of a cheese, you should respond with the name of a wine that pairs well with that cheese. If I give you the name of a wine, you should respond with the name of a cheese that pairs well with that wine. The response should be in the format 'BrandName Category'.


  For example:
  Input: Cheddar
  Cabernet Sauvignon Wine

  Input: Chardonnay
  Brie Cheese

  Input: "

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

  def process_prompt(response)
    puts "ENTERING PROCESS PROMPT"
    if response['choices'] && response['choices'].first['message'] && response['choices'].first['message']['content']
      response_content = response['choices'].first['message']['content'].strip
      puts "API response content: #{response_content}" # This will log the response content in the server console
      words = response_content.split
      last_word = words.pop.downcase
      response_content = words.join(' ')
      if last_word == 'cheese'
        # Save it to the cheese table
        Cheese.create(name: response_content)
      elsif last_word == 'wine'
        # Save it to the wines table
        Wine.create(name: response_content)
      else
        puts "The last word is neither 'cheese' nor 'wine'."
      end
    else
      "There has been an error processing the response please try again"
    end
  end
end
