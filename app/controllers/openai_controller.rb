class OpenaiController < ApplicationController

  def openai_request
    puts params[:prompt]
    @openai = OpenaiService.new(params[:prompt]).call
    respond_to do |format|
      format.js
      format.json { render json: { response: render_to_string(partial: 'response', locals: { openai: @openai }, formats: [:html]) } }
    end
  end

  def pair_and_redirect
    puts params[:prompt]
    @openai = OpenaiService.new(params[:prompt]).call
    redirect_to pairing_path(Pairing.last)
  end
end
