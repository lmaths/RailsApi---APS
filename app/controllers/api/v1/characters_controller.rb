module Api::V1
  class CharactersController < ApiController
        def index
            @characters = Character.all.filter_strenght_greather_than(params[:str_gt])
            .filter_strength_less_than(params[:str_lt])
            .filter_dexterity_greather_than(params[:dex_gt])
            .filter_dexterity_less_than(params[:dex_lt])
            .filter_constitution_greather_than(params[:con_gt])
            .filter_constitution_less_than(params[:con_lt])
            .filter_intelligence_greather_than(params[:int_gt])
            .filter_intelligence_less_than(params[:int_lt])
            .filter_wisdom_greather_than(params[:wis_gt])
            .filter_wisdom_less_than(params[:wis_lt])
            .filter_charisma_greather_than(params[:cha_gt])
            .filter_charisma_less_than(params[:char_lt])
            .filter_character_name(params[:name])

            return render json: @characters.to_json(:include => :skills)
          end
        

          def show
            @characters = Character.find(params[:id])
            return render json: @characters.to_json(:include => :skills) 
          end
        
        
        def create
            @character = Character.new
            if(@character.save)
                return render json: character
            else
        end
    end
  end
end
    


