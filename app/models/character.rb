class Character < ApplicationRecord
  has_many :skills
  scope :filter_charisma, ->(int) { where('charisma = ?', int) if int.present? }
end
