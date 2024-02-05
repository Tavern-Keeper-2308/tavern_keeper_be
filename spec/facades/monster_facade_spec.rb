require 'rails_helper'

RSpec.describe MonsterFacade, type: :facade do
  describe 'MonsterFacade instance methods', :vcr do
    it '#monster_list' do
      facade = MonsterFacade
      monsters = facade.monster_list
    
      monsters.each do |monster|
        expect(monster).to be_a(Monster)

        expect(monster).to respond_to(:index)
        expect(monster.index).to be_a(String)

        expect(monster).to respond_to(:name)
        expect(monster.name).to be_a(String)

        expect(monster).to respond_to(:challenge_rating)
        expect(monster.challenge_rating).to be_a(String)
        
        expect(monster).to respond_to(:size)
        expect(monster.size).to be_a(String)

        expect(monster).to respond_to(:type)
        expect(monster.type).to be_a(String)

        expect(monster).to respond_to(:alignment)
        expect(monster.alignment).to be_a(String)
      end
    end

    it '#single_monster_details(index)' do
      facade = MonsterFacade
      monster = facade.single_monster_details('aboleth').first

      expect(monster).to be_a(Monster)

      expect(monster).to respond_to(:index)
      expect(monster.index).to be_a(String)

      expect(monster).to respond_to(:name)
      expect(monster.name).to be_a(String)

      # expect(monster).to respond_to(:challenge_rating)
      # expect(monster.challenge_rating).to be_a(String)

      expect(monster).to respond_to(:size)
      expect(monster.size).to be_a(String)

      # expect(monster).to respond_to(:type)
      # expect(monster.type).to be_a(String)

      # expect(monster).to respond_to(:alignment)
      # expect(monster.alignment).to be_a(String)
      
      expect(monster).to respond_to(:armor_class)
      expect(monster.armor_class).to be_a(String)

      expect(monster).to respond_to(:speed)
      expect(monster.speed).to be_a(Hash)
      expect(monster.speed['walk']).to be_a(String).or be_nil
      expect(monster.speed['fly']).to be_a(String).or be_nil
      expect(monster.speed['swim']).to be_a(String).or be_nil

      expect(monster).to respond_to(:hit_points)
      expect(monster.hit_points).to be_a(Integer)

      expect(monster).to respond_to(:strength)
      expect(monster.strength).to be_a(Integer)

      expect(monster).to respond_to(:dexterity)
      expect(monster.dexterity).to be_a(Integer)

      expect(monster).to respond_to(:constitution)
      expect(monster.constitution).to be_a(Integer)

      expect(monster).to respond_to(:intelligence)
      expect(monster.intelligence).to be_a(Integer)

      expect(monster).to respond_to(:wisdom)
      expect(monster.wisdom).to be_a(Integer)

      expect(monster).to respond_to(:charisma)
      expect(monster.charisma).to be_a(Integer)

      # expect(monster).to respond_to(:languages)
      # expect(monster.languages).to be_a(String)

      expect(monster).to respond_to(:special_abilities)
      expect(monster.special_abilities).to be_a(Array)

      expect(monster).to respond_to(:actions)
      expect(monster.actions).to be_a(Array)

      expect(monster).to respond_to(:legendary_actions)
      expect(monster.legendary_actions).to be_a(Array)
    end
  end

end