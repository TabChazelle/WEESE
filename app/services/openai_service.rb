# app/services/openai_service.rb

class OpenaiService
  def initialize(prompt)
    @prompt = prompt
  end

  def call
    client = OpenAI::Client.new
    hardcoded_prompt = "Give me a one word answer (or more if the name is Dom Pérignon for example). Please be specific with the names I need 1 single reccomendation and it must be either a wine or a cheese that will pair will with : "
    full_prompt = "#{hardcoded_prompt} #{@prompt}"

    begin
      puts "API request: #{full_prompt}" # This will log the full prompt
      response = client.chat(
        parameters: {
            model: "gpt-3.5-turbo", # Required.
            messages: [{ role: "user", content: full_prompt }], # Use the full_prompt here
            temperature: 0.7
        }
      )
      puts "API response: #{response}" # Print the entire response

      if response['choices'] && response['choices'].first['message'] && response['choices'].first['message']['content']
        response['choices'].first['message']['content'].strip
      else
        "No response from OpenAI API"
      end
    rescue Faraday::TooManyRequestsError
      sleep 1 # Waits for 1 second before retrying
      retry
    end
  end
end
