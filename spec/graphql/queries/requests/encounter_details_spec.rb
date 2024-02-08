require 'rails_helper'

module Queries
  module Encounters
    RSpec.describe Encounter, type: :request do
      describe 'encounter' do
        it 'returns details for a single encounter' do
          encounter = FactoryBot.create(:encounter)
          FactoryBot.create_list(:encounter_monster, 3, encounter: encounter)
    
          query = <<~GRAPHQL
            query {
              getEncounter($id: ID!) {
                encounter(id: $id) {
                  id
                  userName
                  encounterName
                  partySize
                  partyLevel
                  summary
                  description
                  treasure
                  encounterMonsters {
                    monsterName
                    monsterIndex
                  }
                }
              }
            }
          GRAPHQL
    
          post '/graphql', params: { query: query, variables: { id: encounter.id } }
    
          json_response = JSON.parse(response.body)

          expect(response).to have_http_status(:success)

          encounter = json_response['data']['encounter']

          expect(encounter_data['id']).to eq(encounter.id.to_s)
          expect(encounter_data['user_name']).to eq(encounter.user_name)
          expect(encounter_data['encounterName']).to eq(encounter.encounter_name)
          expect(encounter_data['partySize']).to eq(encounter.party_size)
          expect(encounter_data['partyLevel']).to eq(encounter.party_level)
          expect(encounter_data['summary']).to eq(encounter.summary)
          expect(encounter_data['description']).to eq(encounter.description)
          expect(encounter_data['treasure']).to eq(encounter.treasure)
    
          encounter_monsters_data = encounter_data['encounter_monsters']
          expect(encounter_monsters_data.count).to eq(3)
          encounter_monsters_data.each_with_index do |monster_data, index|
            expect(monster_data['monster_name']).to eq(encounter.encounter_monsters[index].monster_name)
            expect(monster_data['monster_index']).to eq(encounter.encounter_monsters[index].monster_index)
          end
        end
      end
    end
  end
end
