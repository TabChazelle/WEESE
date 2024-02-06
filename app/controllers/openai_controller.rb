class OpenaiController < ApplicationController
  def test
    response = Openai::Completion.create(
      model: "text-davinci-002",
      prompt: "Translate the following English text to French: '{}'",
      max_tokens: 60
    )

    @result = response.choices.first.text.strip
  end
end
