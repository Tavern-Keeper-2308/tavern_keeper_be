require 'rails_helper'

describe DndService, type: :service do
  describe 'DndService GrapQL API service methods', :vcr do
    it '#dnd_client, returns a Faraday object ' do
      service = DndService.new
      expect(service.dnd_client).to be_a(Graphlient::Client)
    end

    it '#query_monster_list, returns all monsters, name and index only' do
      service = DndService.new
      response = service.query_monster_list

      error_messages = response.errors.messages
      expect(error_messages.empty?).to eq(true)

      monsters = response.data.monsters
      expect(monsters).to be_a(Array)

      monsters.each do |monster|
        expect(monster.index).to be_a(String)
        expect(monster.name).to be_a(String)
        expect(monster.challenge_rating).to be_a(Integer).or be_a(Float)
        expect(monster.size).to be_a(String)
        expect(monster.type).to be_a(String)
        expect(monster.alignment).to be_a(String)
      end
    end

    it '#query_monster_details(index), returns monster details for single monster' do
      service = DndService.new
      response = service.query_monster_details('aboleth')

      error_messages = response.errors.messages
      expect(error_messages.empty?).to eq(true)

      monster = response.data.monster
      
      expect(monster.index).to be_a(String)
      expect(monster.name).to be_a(String)
      expect(monster.size).to be_a(String)
      # expect(monster.challenge_rating).to be_a(Integer).or be_a(Float)
      # expect(monster.image).to be_a(String).or be_nil
      # expect(monster.type).to be_a(String)
      # expect(monster.alignment).to be_a(String)

      expect(monster.armor_class).to be_a(Array) #If query has ONE Hash item (value/desc), it works as an Array
      expect(monster.armor_class.first.value).to be_a(Integer) 

      expect(monster.speed.walk).to be_a(String).or be_nil #If query has TWO different Hash items, it can work as an Object
      expect(monster.speed.fly).to be_a(String).or be_nil #If query has TWO different Hash items, it can work as an Object
      expect(monster.speed.swim).to be_a(String).or be_nil

      expect(monster.hit_points).to be_a(Integer)
      expect(monster.strength).to be_a(Integer)
      expect(monster.dexterity).to be_a(Integer)
      expect(monster.constitution).to be_a(Integer)
      expect(monster.intelligence).to be_a(Integer)
      expect(monster.wisdom).to be_a(Integer)
      expect(monster.charisma).to be_a(Integer)
      # expect(monster.languages).to be_a(String)

      expect(monster.damage_vulnerabilities).to be_a(Array)
      expect(monster.damage_resistances).to be_a(Array)
      expect(monster.damage_immunities).to be_a(Array)

      expect(monster.proficiency_bonus).to be_a(Integer)

      expect(monster.proficiencies).to be_a(Array)
      monster.proficiencies.each do |proficiency|
        expect(proficiency.proficiency.name).to be_a(String)
        expect(proficiency.value).to be_a(Integer)
      end

      expect(monster.senses.blindsight).to be_a(String)
      expect(monster.senses.darkvision).to be_a(String)
      expect(monster.senses.passive_perception).to be_a(Integer)

      expect(monster.special_abilities).to be_a(Array) #If query has multiple desc, it works as an Array
      monster.special_abilities.each do |ability|
        expect(ability.name).to be_a(String)
        expect(ability.desc).to be_a(String)
      end

      expect(monster.actions).to be_a(Array)
      monster.actions.each do |action|
        expect(action.name).to be_a(String)
        expect(action.desc).to be_a(String)
      end

      expect(monster.legendary_actions).to be_a(Array).or be_nil
      if !monster.legendary_actions.nil?
        expect(monster.legendary_actions).to be_a(Array)
        monster.legendary_actions.each do |sp_ability|
          expect(sp_ability.name).to be_a(String)
          expect(sp_ability.desc).to be_a(String)
        end
      end

      expect(monster.condition_immunities).to be_a(Array)
      monster.condition_immunities.each do |immunity|
        expect(immunity).to be_a(String)
      end
    end 
  end
end
