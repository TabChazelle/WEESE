class OpenaiController < ApplicationController
  def create
    @openai = OpenaiService.new(params[:openai][:prompt]).call

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('openai_response', partial: 'response', locals: { openai: @openai })
      end
      format.html
    end
  end
end
