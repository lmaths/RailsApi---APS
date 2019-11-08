module Api::V1
  class CharactersController < ApiController
    def index
      characters = Character.all
      characters = characters.where('charisma = ?', params[:charisma]) if params[:charisma].present?
      render json: characters
    end
  end
end
