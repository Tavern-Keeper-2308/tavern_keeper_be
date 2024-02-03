require 'rails_helper'

describe DndService, type: :service do
  describe 'DndService GrapQL API service methods', :vcr do
    it '#dnd_client, returns a Faraday object ' do
      service = DndService.new
      expect(service.dnd_client).to be_a(Graphlient::Client)
    end

    # it '#query_monsters, returns all monsters, name and index only' do
    #   service = DndService.new
    #   query_response = service.query_monsters

    #   expect(query_response.status).to eq(200)
    #   expect(query_response).to be_a(Hash)

    #   expect(query_response).to have_key(:data)

    #   data = query_response[:data]
    #   expect(data).to have_key(:monsters)

    #   monsters = data[:monsters]
    #   expect(monsters).to be_a(Array)

    #   monsters.each do |monster|
    #     expect(monster).to have_key(:name)
    #     expect(monster[:name]).to be_a(String)
    #     expect(monster).to have_key(:index)
    #     expect(monster[:index]).to be_a(String)
    #   end
    # end

  end
end