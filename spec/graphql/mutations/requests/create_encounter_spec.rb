require 'rails_helper'

module Mutations
  module Encounters
    RSpec.describe CreateEncounter, type: :request do
      describe '.resolve' do
        it 'creates an encounter', :vcr do
          encounter_name = 'Party Wipe'
          party_size = 4
          party_level = 3
          summary = 'Pretty spicy'
          description = "You're about to fight 3 beholders, feel free to cry"
          treasure = '50GP, Longbow'
          encounter_monsters = ['Beholder', 'Beholder']

          post '/graphql', params: { query: query(encounter_name, party_size, party_level, summary, description, treasure, encounter_monsters) }

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

      def query(encounter_name, party_size, party_level, summary, description, treasure, encounter_monsters)
        <<~GQL
          mutation {
            createEncounter(
              encounterName: "#{encounter_name}",
              partySize: "#{party_size}",
              partyLevel: "#{party_level}",
              summary: "#{summary}",
              description: "#{description}",
              treasure: "#{treasure}",
              encounterMonsters: #{encounter_monsters}
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
