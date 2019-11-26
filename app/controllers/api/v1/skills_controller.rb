module Api::V1
    class SkillsController < ApiController
        before_action :get_character
        before_action :set_skill, only: [:show, :update, :destroy]
        
        def index
            skill = Skill.all
            render json: skill
        end

        def create
            @skill = @character.skills.new(params_skill)
            if(skill.save)
                render json: @skill
            else
                render json: @skill.errors.messages, status: :unprocessable_entity
        end
    end

    def update
        if @skill.update(skill_params)
          render json: @skill
        else                                                
          render json: @skill.errors, status: :unprocessable_entity
        end
      end

    def destroy
        @skill.destroy
    end


    
          def get_character
            @character = Character.find(params[:character_id])
          end
         
          def set_skill_character
            @skill = @character.skills.find(params[:id])
          end

          
          def params_skill
            params.require(:skill).permit(:character_id, :name, :ability, :proficient)
          end
    

end


    
end