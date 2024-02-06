require 'rails_helper'

module Queries
  module Monster
    RSpec.describe Monster, type: :request do
      describe 'monster' do
        it 'returns monster details', :vcr do
          post '/graphql', params: { query: query, variables: { 'index': 'aboleth'} } # Variables are now in request params, explanaition below
          expect(response).to be_successful
          expect(response.status).to eq(200)
          expect(response).to have_http_status(:ok)

          json = JSON.parse(response.body)
          monster = json['data']['monster'].first
          
          expect(monster['index']).to be_a(String)
          expect(monster['name']).to be_a(String)
          expect(monster['size']).to be_a(String)
          # expect(monster['type']).to be_a(String)
          # expect(monster['alignment']).to be_a(String)
          # expect(monster['challengeRating']).to be_a(String)
          expect(monster['image']).to be_nil
          expect(monster['armorClass']).to be_a(String)
          expect(monster['speed']).to be_a(Hash)
          expect(monster['hitPoints']).to be_a(Integer)
          expect(monster['strength']).to be_a(Integer)
          expect(monster['dexterity']).to be_a(Integer)
          expect(monster['constitution']).to be_a(Integer)
          expect(monster['intelligence']).to be_a(Integer)
          expect(monster['wisdom']).to be_a(Integer)
          expect(monster['charisma']).to be_a(Integer)
          # expect(monster['languages']).to be_an(String)
          expect(monster['specialAbilities']).to be_an(Array)
          expect(monster['actions']).to be_an(Array)
          expect(monster['legendaryActions']).to be_an(Array)
          expect(monster['conditionImmunities']).to be_an(Array)
        end
      end

      def query
        # variables = { 'index': index } ## Removed from here and put into the request parameters. While inspecting the controller action, I found params[:variables] to be blank with this syntax.
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
              conditionImmunities
            }
          }
        GQL
      end
    end
  end
end
