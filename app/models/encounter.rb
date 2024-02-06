class Encounter < ApplicationRecord
  validates :party_size, :party_level, :encounter_name, :user_name, presence: :true
  has_many :encounter_monsters
end
