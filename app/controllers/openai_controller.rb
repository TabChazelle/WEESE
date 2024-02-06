class OpenaiController < ApplicationController
  def create
    client = OpenAI::Client.new
    prompt = params[:openai][:prompt] # This is the value from your form

    begin
      response = client.chat(
        parameters: {
            model: "gpt-4", # Required.
            messages: [{ role: "user", content: prompt }], # Use the prompt here
            temperature: 0.7,
        })
      puts response.dig("choices", 0, "message", "content")

      if response['choices'] && response['choices'].first['text']
        @openai = response['choices'].first['text'].strip
      else
        @openai = "No response from OpenAI API"
      end

      respond_to do |format|
        format.turbo_stream
        format.html
      end
    rescue Faraday::TooManyRequestsError
      sleep 1 # Waits for 1 second before retrying
      retry
    end
  end
end
