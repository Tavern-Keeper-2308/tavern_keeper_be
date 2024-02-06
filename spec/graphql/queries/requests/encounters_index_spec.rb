require 'rails_helper'

module Queries
  module Encounters
    RSpec.describe Encounters, type: :request do
      describe 'encounters' do
        before(:each) do
          @encounters = create_list(:encounter, 4)
        end
        it 'returns all encounters associated with a given User ID' do
          post '/graphql', params: { query: query, variables: { 'userId': 1 }}
          json = JSON.parse(response.body)
          binding.pry
          data = json['data']['encounters']
        end
      end
      def query
        <<~GQL
          query getEncounters($userId: ID!) {
            encounters(userId: $userId) {
              encounterName
              partySize
              partyLevel
              summary
              description
              treasure
            }
          }
        GQL
      end
    end 
  end
end

