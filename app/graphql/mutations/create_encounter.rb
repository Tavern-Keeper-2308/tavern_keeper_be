class Mutations::CreateEncounter < Mutations::BaseMutation
  argument :encounterName, String, required: true
  argument :partySize, Integer, required: true
  argument :partyLevel, Integer, required: true
  argument :summary, String, required: false
  argument :description, String, required: false
  argument :treasure, String, required: false
  argument :encounterMonsters, [String], required: true

  field :encounter, Types::EncounterType, null: false
  field :errors, [String], null: false

  def resolve(input)
    encounter = Encounter.new(encounter_name: input[:encounterName], 
                              party_size: input[:partySize], 
                              party_level: input[:partyLevel], 
                              summary: input[:summary], 
                              description: input[:description], 
                              treasure: input[:treasure],
                              user_name: "Shrek")

    if encounter.save
      encounter_monsters = input[:encounterMonsters]
      encounter_monsters.each do |monster_name|
        EncounterMonster.create!(encounter_id: encounter.id, monster_name: monster_name)
      end
      { encounter: encounter, errors: [] }
    else
      { encounter: nil, errors: encounter.errors.full_messages }
    end
  end
end
