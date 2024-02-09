class EncounterMonster < ApplicationRecord
  validates :monster_name, presence: true
  belongs_to :encounter
end
