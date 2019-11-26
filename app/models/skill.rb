class Skill < ApplicationRecord
    belongs_to :character
    validates :name, presence: true
    validates_inclusion_of :ability, in: [ "strength","dexterity", "constitution","intelligence","wisdom" ,"charisma"], presence: true

    def get_atributo
        if Character.column_names.include?self.ability 
          self.ability   
        end
    end

 def set_modificador
     valor = character.read_attribute(get_atributo)
     ability = 1
     modificador = -5
     while ability < valor 
        modificador += 1
        ability += 2
     end
        modificador
 end

 def score
    if self.proficient
         return modificador + character.proficient_bonus
    else
         set_modificador
    end
 end

end
