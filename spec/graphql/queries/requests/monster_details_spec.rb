require 'rails_helper'

module Queries
  module Monster
    RSpec.describe Monster, type: :request do
      describe '.' do
        it 'returns monster details', :vcr do
          post '/graphql', params: { query: query('aboleth') }
          json = JSON.parse(response.body)
          data = json['data']['monster']
          
          expect(monster['index']).to be_a(String)
          expect(monster['name']).to be_a(String)
          expect(monster['size']).to be_a(String)
          expect(monster['type']).to be_a(String)
          expect(monster['alignment']).to be_a(String)
          expect(monster['challengeRating']).to be_a(String)
          expect(monster['image']).to be_a(String)
          expect(monster['armorClass']).to be_a(String)
          expect(monster['speed']).to be_a(Hash)
          expect(monster['hitPoints']).to be_a(String)
          expect(monster['strength']).to be_a(String)
          expect(monster['dexterity']).to be_a(String)
          expect(monster['constitution']).to be_a(String)
          expect(monster['intelligence']).to be_a(String)
          expect(monster['wisdom']).to be_a(String)
          expect(monster['charisma']).to be_a(String)
          expect(monster['languages']).to be_an(Array)
          expect(monster['specialAbilities']).to be_an(Array)
          expect(monster['actions']).to be_an(Array)
          expect(monster['legendaryActions']).to be_an(Array)
        end
      end

      def query(index)
        variables = { 'index': index }
        <<~GQL
          query getMonster($index: String!) {
            monster(index: $index) {
              index
              name
              challengeRating
              image
              size
              type
              alignment
              armorClass
              speed {
                walk
                fly
                swim
              }
              hitPoints
              strength
              dexterity
              constitution
              intelligence
              wisdom
              charisma
              languages
              specialAbilities {
                name
                desc
              }
              actions {
                name
                desc
              }
              legendaryActions {
                name
                desc
              }
            }
          }
        GQL
      end
    end
  end
end
