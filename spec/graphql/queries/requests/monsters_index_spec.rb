require 'rails_helper'

module Queries
  module Monsters
    RSpec.describe Monsters, type: :request do
      describe 'monsters' do
        it 'returns all monsters', :vcr do
          post '/graphql', params: { query: query }
          json = JSON.parse(response.body)
          data = json['data']['monsters']

          data.each do |monster|
            expect(monster['index']).to be_a(String)
            expect(monster['monsterName']).to be_a(String)
            expect(monster['size']).to be_a(String)
            expect(monster['type']).to be_a(String)
            expect(monster['alignment']).to be_a(String)
            expect(monster['challengeRating']).to be_a(String)
            expect(monster).to_not respond_to('armorClass')
            expect(monster).to_not respond_to('speed')
            expect(monster).to_not respond_to('hitPoints')
            expect(monster).to_not respond_to('strength')
            expect(monster).to_not respond_to('dexterity')
            expect(monster).to_not respond_to('constitution')
            expect(monster).to_not respond_to('intelligence')
            expect(monster).to_not respond_to('wisdom')
            expect(monster).to_not respond_to('charisma')
            expect(monster).to_not respond_to('languages')
            expect(monster).to_not respond_to('special_abilities')
            expect(monster).to_not respond_to('actions')
            expect(monster).to_not respond_to('legendary_actions')
          end
        end
      end

      def query
        <<~GQL
          query getMonsters {
            monsters {
              index
              monsterName
              size
              type
              alignment
              challengeRating
            }
          }
        GQL
      end
    end
  end
end
