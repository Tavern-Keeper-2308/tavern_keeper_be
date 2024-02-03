require 'rails_helper'

describe DndService, type: :service do
  describe 'DndService GrapQL API service methods', :vcr do
    it '#dnd_client, returns a Faraday object ' do
      service = DndService.new
      expect(service.dnd_client).to be_a(Graphlient::Client)
    end

    it '#query_monster_names, returns all monsters, name and index only' do
      service = DndService.new
      response = service.query_monster_names

      error_messages = response.errors.messages
      expect(error_messages.empty?).to eq(true)

      monsters = response.data.monsters
      expect(monsters).to be_a(Array)

      monsters.each do |monster|
        expect(monster.index).to be_a(String)
        expect(monster.name).to be_a(String)
      end
    end

  end
end
