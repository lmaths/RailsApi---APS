module Api::V1
    class SkillsController < ApiController
        def index
            skill = Skill.all
            render json: skill
        end

        def create
            skill = Skill.new
            if(skill.save)
                render json: skill
            else
                
        end
    end

end
    
end