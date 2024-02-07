class OpenaiController < ApplicationController
  # skip_before_action :verify_authenticity_token

  def create
    @openai = OpenaiService.new(params[:openai][:prompt]).call
    respond_to do |format|
      format.js
      format.json { render json: { response: render_to_string(partial: 'response', locals: { openai: @openai }, formats: [:html]) } }
      format.html
    end
  end

  def openai_request
    puts params[:prompt]
    @openai = OpenaiService.new(params[:prompt]).call
    respond_to do |format|
      format.js
      format.json { render json: { response: render_to_string(partial: 'response', locals: { openai: @openai }, formats: [:html]) } }
    end
  end
end
