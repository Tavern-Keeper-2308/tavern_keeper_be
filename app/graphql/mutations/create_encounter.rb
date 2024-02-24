class Mutations::CreateEncounter < Mutations::BaseMutation
  argument :encounterName, String, required: true
  argument :partySize, Integer, required: true
  argument :partyLevel, Integer, required: true
  argument :summary, String, required: false
  argument :description, String, required: false
  argument :treasure, String, required: false
  argument :encounterMonsterIndexes, [String], required: true
  argument :user_id, Integer, required: true

  field :encounter, Types::EncounterType, null: false
  field :errors, [String], null: false

  def resolve(input)
    encounter = Encounter.new(encounter_name: input[:encounterName], 
                              party_size: input[:partySize], 
                              party_level: input[:partyLevel], 
                              summary: input[:summary], 
                              description: input[:description], 
                              treasure: input[:treasure],
                              user_id: input[:user_id])

    if encounter.save
      input[:encounterMonsterIndexes].each do |monster_index|
        EncounterMonster.create!(encounter_id: encounter.id,
                                monster_name: monster_index.gsub('-', ' ').titleize,
                                monster_index: monster_index)
      end
      { encounter: encounter, errors: [] }
    else
      { encounter: nil, errors: encounter.errors.full_messages }
    end
  end
end
