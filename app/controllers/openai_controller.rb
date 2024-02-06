class OpenaiController < ApplicationController
  def create
    client = OpenAI::Client.new
    user_prompt = params[:openai][:prompt] # Passed over from the form

    hardcoded_prompt = "Give me a one word answer, I need 1 single recommendation for a cheese that pairs well with"
    full_prompt = "#{hardcoded_prompt} #{user_prompt}"

    begin
      puts "API request: #{full_prompt}" # This pastes the full prompt to the console
      response = client.chat(
        parameters: {
            model: "gpt-3.5-turbo", # the version of the model
            messages: [{ role: "user", content: full_prompt }], # Full prompt including the hardcoded bit.
            temperature: 0.7
        }
      )
      puts "API response: #{response}" # Print the entire response

      if response['choices'] && response['choices'].first['message'] && response['choices'].first['message']['content']
        @openai = response['choices'].first['message']['content'].strip
      else
        @openai = "No response from OpenAI API"
      end
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('openai_response', partial: 'response', locals: { openai: @openai })
        end
        format.html
      end
    rescue Faraday::TooManyRequestsError
      sleep 1 # Waits for 1 second before retrying
      retry
    end
  end
end
