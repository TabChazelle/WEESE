class OpenaiController < ApplicationController
  def test
    response = Openai.create_completion(
      model: "text-davinci-002",
      prompt: "Translate the following English text to French: 'We are building a wine and cheese app!'",
      max_tokens: 60
    )

    @result = response['choices'].first['text'].strip
  end

  def show
    response = Openai.create_completion(
      model: "text-davinci-002",
      prompt: "Translate the following English text to French: '#{params[:id]}'",
      max_tokens: 60
    )

    @openai = response['choices'].first['text'].strip
  end
end
