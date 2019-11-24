class Skill < ApplicationRecord
    belongs_to :character
    validates :name, presence: true, length: {maximum: 25}
    validates_inclusion_of :ability, in: [ "strength","dexterity", "constitution","intelligence","wisdom" ,"charisma"], presence: true

    
end
