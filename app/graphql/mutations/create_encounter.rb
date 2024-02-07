class Mutations::CreateEncounter < Mutations::BaseMutation
  argument :encounter_name, String, required: true
  argument :party_size, String, required: true
  argument :party_level, String, required: true
  argument :summary, String, required: false
  argument :description, String, required: false
  argument :treasure, String, required: false
  argument :encounter_monsters, [String], required: true

  field :encounter, Types::EncounterType, null: false
  field :errors, [String], null: false

  def resolve(encounter_name:, party_size:, party_level:, summary:, description:, treasure:, encounter_monsters:)
    encounter = Encounter.new(encounter_name: encounter_name, 
                              party_size: party_size, 
                              party_level: party_level, 
                              summary: summary, 
                              description: description, 
                              treasure: treasure)

    if encounter.save
      encounter_monsters.each do |monster_name|
        EncounterMonster.create!(encounter: encounter, monster_name: monster_name)
      end
      { encounter: encounter, errors: [] }
    else
      { encounter: nil, errors: encounter.errors.full_messages }
    end
  end
end
