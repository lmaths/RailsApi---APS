class Character < ApplicationRecord
    
    has_many :skills
    validates :strength, :dexterity, :intelligence, :wisdom, :charisma , presence: true, inclusion:{in: 1..20},  numericality: { only_integer: true }
    
    scope :filter_strenght_greather_than, ->(int) {where('strength > ?', int) if int.present?}
    scope :filter_strength_less_than, ->(int) {where('strength < ?', int) if int.present?}
    scope :filter_dexterity_greather_than, ->(int) {where('dexterity > ?', int) if int.present?}
    scope :filter_dexterity_less_than, ->(int) {where('dexterity > ?', int) if int.present?}
    scope :filter_constitution_greather_than, ->(int) {where('constitution > ?', int) if int.present?}
    scope :filter_constitution_less_than, ->(int) {where('constitution < ?', int) if int.present?}
    scope :filter_intelligence_greather_than, ->(int) {where('intelligence > ?', int) if int.present?}
    scope :filter_intelligence_less_than, ->(int) {where('intelligence < ?', int) if int.present?}
    scope :filter_wisdom_greather_than, ->(int) {where('wisdom > ?', int) if int.present?}
    scope :filter_wisdom_less_than, ->(int) {where('wisdom < ?', int) if int.present?}
    scope :filter_charisma_greather_than, ->(int) {where('charisma > ?', int) if int.present?}
    scope :filter_charisma_less_than, ->(int) {where('charisma < ?', int) if int.present?}
    scope :filter_character_name, ->(string){where('name LIKE ?', "%#{string}%") if string.present?}


    def get_level
       return level = (strength + dexterity + intelligence + wisdom + charisma) / 6
    end

    def proficient_bonus
        
        case get_level
        when 1..4 then 2
        when 5..8 then 3
        when 9..12 then 4
        when 13..16 then 5
        when 17..20 then 6
        end
       
    end

    def get_names_alunos
    return "Matheus Lima, Jussara, Fernanda"
    end
    
    

end
