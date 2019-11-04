module Api::V1
    class CharactersController < ApiController
        def index
            character = Character.all
            render json: character
        end
    end
    
end