require 'rails_helper'

module Mutations
  module Encounters
    RSpec.describe CreateEncounter, type: :request do
      describe '.resolve' do
        it 'creates an encounter', :vcr do
          post '/graphql', params: { query: mutation }

          json_response = JSON.parse(response.body)
          data = json_response['data']['createEncounter']
          errors = data['errors']
          encounter = data['encounter']

          expect(errors).to be_empty
          expect(encounter).not_to be_nil
          expect(encounter['encounterName']).to eq('Party Wipe')
          expect(encounter['partySize']).to eq(4)
          expect(encounter['partyLevel']).to eq(3)
          expect(encounter['summary']).to eq('I hope this works')
          expect(encounter['description']).to eq('Monster party!')
          expect(encounter['treasure']).to eq('We not deserve anything')
          expect(encounter['encounterMonsters']).to eq([{
                                                          "monsterName"=>"Beholder", 
                                                          "monsterIndex"=>"beholder"
                                                        }, 
                                                        {
                                                          "monsterName"=>"Goblin", 
                                                          "monsterIndex"=>"goblin"
                                                        }])
          expect(encounter['userName']).to eq('Shrek')
        end

        context 'when encounter creation fails' do
          it 'returns errors' do
            post '/graphql', params: { query: bad_mutation }
      
            json_response = JSON.parse(response.body)
            data = json_response['data']['createEncounter']
            errors = data['errors']
            encounter = data['encounter']
      
            expect(errors).not_to be_empty
            expect(encounter).to be_nil
          end
        end
      end

      def mutation
        <<~GQL
          mutation {
            createEncounter(input: {
              encounterName: "Party Wipe",
              partySize: 4,
              partyLevel: 3,
              summary: "I hope this works",
              description: "Monster party!",
              treasure: "We not deserve anything",
              encounterMonsterIndexes: ["beholder", "goblin"]
              userName: "Shrek"
            }) {
            encounter {
              id
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
              userName
            }
            errors
          }
        }
        GQL
      end

      def bad_mutation
        <<~GQL
          mutation {
            createEncounter(input: {
              encounterName: "Party Wipe",
              partySize: 4,
              partyLevel: 3,
              summary: "I hope this works",
              description: "Monster party!",
              treasure: "We not deserve anything",
              encounterMonsters: ["beholder", "goblin"]
              userName: 
            }) {
            encounter {
              id
              encounterName
              partySize
              partyLevel
              summary
              description
              treasure
              encounterMonsters {
                monsterName
              }
              userName
            }
            errors
          }
        }
        GQL
      end
    end
  end
end
