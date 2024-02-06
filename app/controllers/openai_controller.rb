class OpenaiController < ApplicationController
  def create
    client = OpenAI::Client.new
    begin
      response = client.chat(
        parameters: {
            model: "gpt-3.5-turbo", # Required.
            messages: [{ role: "user", content: "Hello!" }], # Required.
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
