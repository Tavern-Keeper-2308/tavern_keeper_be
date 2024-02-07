require 'rails_helper'

module Mutations
  module Encounters
    RSpec.describe CreateEncounter, type: :request do
      describe '.resolve' do
        it 'creates an encounter', :vcr do
          encounter_name = 'Test Encounter'
          party_size = 'Medium'
          party_level = '5'
          summary = 'A brief summary of the encounter'
          description = 'A detailed description of the encounter'
          treasure = 'Some valuable treasure'
          encounter_monsters = [
            { name: 'Monster 1' },
            { name: 'Monster 2' }
          ]

          post '/graphql', params: { query: query_string(encounter_name, party_size, party_level, summary, description, treasure, encounter_monsters) }

          json_response = JSON.parse(response.body)
          data = json_response['data']['createEncounter']
          errors = data['errors']
          encounter = data['encounter']

          expect(errors).to be_empty
          expect(encounter).not_to be_nil
          expect(encounter['encounterName']).to eq(encounter_name)
          expect(encounter['partySize']).to eq(party_size)
          expect(encounter['partyLevel']).to eq(party_level)
          expect(encounter['summary']).to eq(summary)
          expect(encounter['description']).to eq(description)
          expect(encounter['treasure']).to eq(treasure)
          expect(encounter['encounterMonsters']).to eq(encounter_monsters)
        end
      end

      def query_string(encounter_name, party_size, party_level, summary, description, treasure, encounter_monsters)
        <<~GQL
          mutation {
            createEncounter(
              encounterName: "#{encounter_name}",
              partySize: "#{party_size}",
              partyLevel: "#{party_level}",
              summary: "#{summary}",
              description: "#{description}",
              treasure: "#{treasure}",
              encounterMonsters: [
                #{encounter_monsters.map { |monster| "{ name: \"#{monster[:name]}\"}" }.join(',')}
              ]
            ) {
              encounter {
                encounterName
                partySize
                partyLevel
                summary
                description
                treasure
                encounterMonsters {
                  monsterName
                }
              }
              errors
            }
          }
        GQL
      end
    end
  end
end
