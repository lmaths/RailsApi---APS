module Api::V1
  class CharactersController < ApiController
    def index
      characters = Character.filter_charisma(params[:charisma])
      render json: characters
    end
  end
end
