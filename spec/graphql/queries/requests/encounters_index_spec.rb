require 'rails_helper'

module Queries
  module Encounters
    RSpec.describe Encounters, type: :request do
      describe 'encounters' do
        before(:each) do
          @list = create_list(:encounter_monster, 6)
        end
        it 'returns all encounters associated with a given User ID' do
          post '/graphql', params: { query: query, variables: { 'userName': "Drizzt" }}
          json = JSON.parse(response.body)
          data = json['data']['encounters']
          expect(data.count).to eq(6)
          data.each do |encounter|
          expect(encounter['userName']).to eq("Drizzt")
          expect(encounter['encounterName']).to be_a(String)
          expect(encounter['partySize']).to be_a(Integer)
          expect(encounter['partyLevel']).to be_a(Integer)
          expect(encounter['summary']).to be_a(String)
          expect(encounter['description']).to be_a(String)
          expect(encounter['treasure']).to be_a(String)
          expect(encounter['encounterMonsters']).to be_a(Array)
            encounter['encounterMonsters'].each do |emonster|
              expect(emonster['monsterName']).to be_a(String)
              expect(emonster['monsterIndex']).to be_a(String)
            end
          end
        end
      end
      
      def query
        <<~GQL
          query getEncounters($userName: String!) {
            encounters(userName: $userName) {
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
        GQL
      end
    end 
  end
end

