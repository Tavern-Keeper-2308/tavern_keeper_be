require 'rails_helper'

module Queries
  module Monsters
    RSpec.describe Monsters, type: :request do
      describe '.' do
        it 'returns all monsters', :vcr do
          post '/graphql', params: { query: query }
          json = JSON.parse(response.body)
          data = json['data']['monsters']

          data.each do |monster|
            expect(monster['index']).to be_a(String)
            expect(monster['name']).to be_a(String)
            expect(monster['size']).to be_a(String)
            expect(monster['type']).to be_a(String)
            expect(monster['alignment']).to be_a(String)
            expect(monster['challengeRating']).to be_a(String)
            # expect not to have other detail fields
          end
        end
      end

      def query
        <<~GQL
          query getMonsters {
            monsters {
              index
              name
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
