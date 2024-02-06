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
      expect(monster.index).to eq('aboleth')
      expect(monster.name).to be_a(String)
      expect(monster.name).to eq('Aboleth')
      expect(monster.size).to be_a(String)
      expect(monster.size).to eq('LARGE')
      # expect(monster.challenge_rating).to be_a(Integer).or be_a(Float)
      # expect(monster.image).to be_a(String).or be_nil
      # expect(monster.type).to be_a(String)
      # expect(monster.alignment).to be_a(String)

      expect(monster.armor_class).to be_a(Array)
      expect(monster.armor_class.first.value).to be_a(Integer)
      expect(monster.armor_class.first.value).to eq(17)

      expect(monster.speed.walk).to be_a(String).or be_nil
      expect(monster.speed.walk).to eq('10 ft.')
      expect(monster.speed.fly).to be_a(String).or be_nil
      expect(monster.speed.swim).to be_a(String).or be_nil
      expect(monster.speed.swim).to eq('40 ft.')

      expect(monster.hit_points).to be_a(Integer)
      expect(monster.hit_points).to eq(135)
      expect(monster.strength).to be_a(Integer)
      expect(monster.strength).to eq(21)
      expect(monster.dexterity).to be_a(Integer)
      expect(monster.dexterity).to eq(9)
      expect(monster.constitution).to be_a(Integer)
      expect(monster.constitution).to eq(15)
      expect(monster.intelligence).to be_a(Integer)
      expect(monster.intelligence).to eq(18)
      expect(monster.wisdom).to be_a(Integer)
      expect(monster.wisdom).to eq(15)
      expect(monster.charisma).to be_a(Integer)
      expect(monster.charisma).to eq(18)
      # expect(monster.languages).to be_a(String)

      expect(monster.damage_vulnerabilities).to be_a(Array)
      expect(monster.damage_vulnerabilities).to be_empty
      expect(monster.damage_resistances).to be_a(Array)
      expect(monster.damage_resistances).to be_empty
      expect(monster.damage_immunities).to be_a(Array)
      expect(monster.damage_immunities).to be_empty

      expect(monster.proficiency_bonus).to be_a(Integer)
      expect(monster.proficiency_bonus).to eq(4)

      expect(monster.proficiencies).to be_a(Array)
      expect(monster.proficiencies.first.proficiency.name).to eq('Saving Throw: CON')
      expect(monster.proficiencies.first.value).to eq(6)
      expect(monster.proficiencies.last.proficiency.name).to eq('Skill: Perception')
      expect(monster.proficiencies.last.value).to eq(10)
      monster.proficiencies.each do |proficiency|
        expect(proficiency.proficiency.name).to be_a(String)
        expect(proficiency.value).to be_a(Integer)
      end

      expect(monster.senses.blindsight).to be_a(String).or be_nil
      expect(monster.senses.darkvision).to be_a(String).or be_nil
      expect(monster.senses.darkvision).to eq('120 ft.')
      expect(monster.senses.passive_perception).to be_a(Integer).or be_nil
      expect(monster.senses.passive_perception).to eq(20)

      expect(monster.special_abilities).to be_a(Array)
      expect(monster.special_abilities.first.name).to eq('Amphibious')
      expect(monster.special_abilities.first.desc).to eq('The aboleth can breathe air and water.')
      expect(monster.special_abilities.last.name).to eq('Probing Telepathy')
      expect(monster.special_abilities.last.desc).to include('If a creature communicates telepathically with the aboleth, the aboleth')
      monster.special_abilities.each do |ability|
        expect(ability.name).to be_a(String)
        expect(ability.desc).to be_a(String)
      end

      expect(monster.actions).to be_a(Array)
      expect(monster.actions.first.name).to eq('Multiattack')
      expect(monster.actions.first.desc).to eq('The aboleth makes three tentacle attacks.')
      expect(monster.actions.last.name).to eq('Enslave')
      expect(monster.actions.last.desc).to include('The aboleth targets one creature it can see within 30 ft. of it. The t')
      monster.actions.each do |action|
        expect(action.name).to be_a(String)
        expect(action.desc).to be_a(String)
      end

      expect(monster.legendary_actions).to be_a(Array).or be_nil
      if !monster.legendary_actions.nil?
        expect(monster.legendary_actions).to be_a(Array)
        expect(monster.legendary_actions.first.name).to eq('Detect')
        expect(monster.legendary_actions.first.desc).to eq('The aboleth makes a Wisdom (Perception) check.')
        expect(monster.legendary_actions.last.name).to eq('Psychic Drain (Costs 2 Actions)')
        expect(monster.legendary_actions.last.desc).to include('One creature charmed by the aboleth takes 10 (3d6) ps')
        monster.legendary_actions.each do |sp_ability|
          expect(sp_ability.name).to be_a(String)
          expect(sp_ability.desc).to be_a(String)
        end
      end

      expect(monster.condition_immunities).to be_a(Array)
      expect(monster.condition_immunities).to be_empty
      monster.condition_immunities.each do |immunity|
        expect(immunity).to be_a(String)
      end
    end 
  end
end
